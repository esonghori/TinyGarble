# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build

Out-of-source build in `bin/`. `./configure` runs cmake in Release with logging on; running `cmake ..` inside `bin/` yourself gives a Debug build (Debug forces `ENABLE_LOG=ON`).

```
./configure && cd bin && make -j$(nproc)
```

Deps: g++ (>= 4.6.3), OpenSSL, Boost >= 1.45 (`program_options`), cmake >= 3.5.
`crypto/block.h`/`aes.h` are written against x86 SSE/AES-NI intrinsics. On AArch64 they include `crypto/neon_compat.h` instead, which maps the ~30 intrinsics this codebase uses onto NEON and the ARMv8 crypto extensions; `-march=native` is used on x86 and `-march=armv8-a+crypto` on ARM. The shim is bit-exact, which is load-bearing: an x86 garbler and an ARM evaluator must agree on every label, so a single-machine test would not catch a discrepancy. If you add an intrinsic, add it to the shim too.

`make` in `bin/` also unpacks `scd/netlists/v.tar.gz` into `bin/scd/netlists/` and runs `bin/scd/V2SCD_ALL.sh`, which translates every unpacked `.v` netlist to `.scd`. Those artifacts are gitignored; the `.v` and `.scd` files under `bin/scd/netlists/` are generated, never edit them.

## Test

```
cd bin && ctest -V              # all
ctest -R Garbled_Circuit -V     # one test
```

Tests use `util/minunit.h` (no gtest). ctest decides pass/fail via `FAIL_REGULAR_EXPRESSION` on stdout matching `Failed|failed` — a test binary that returns 0 while printing "failed" still fails, and a crash before printing anything can pass. Registered names: `Util_Util_Test`, `TCPIP_TCPIP_Test`, `Crypto_BN_Test`, `Crypto_OT_Test`, `Crypto_OT_Extension_Test`, `SCD_V2SCD_Test`, `SCD_SCD_Evaluator_Test`, `Garbled_Circuit_Garbled_Circuit_Test`.

Test binaries take `--log2std` / `--error2std` to route logs to stdout (see `util/log.cpp`). Two-party tests (`Crypto_OT_*`, `Garbled_Circuit_*`) `fork()` and talk over localhost TCP via `tcpip/tcpip_testsuit.h`; a leftover process holding port 1234 makes them hang or fail.

## Pipeline

The four stages are independent tools; understanding any change means knowing which stage it lives in.

1. **Verilog source** — hand-written `.v` per function under `circuit_synthesis/<function>/`.
2. **Synthesis** (`circuit_synthesis/`) — Synopsys Design Compiler or Yosys, driven by `./compile` scripts and `.dcsh` files, against the custom cell library in `circuit_synthesis/lib/`. Not part of the cmake build; needs external EDA tools. Output is a netlist `.v`.
3. **`V2SCD_Main`** (`scd/`) — netlist `.v` → `.scd`. `parse_netlist.cpp` reads the netlist, `scheduling.cpp` topologically orders gates, `scd.cpp` writes/reads the format.
4. **`garbled_circuit/TinyGarble`** — two parties each load the same `.scd` and run the GC protocol.

The netlist tokenizer in `parse_netlist.cpp` is line-oriented and deliberately dumb: it strips comments, then matches bare cell names (`AND`, `IV`, `BUF`, `DFF`, `FADDER`, …) and `.PIN` tokens. It does not understand Verilog attributes (`(* ... *)`) or expression syntax, hence `write_verilog -noattr -noexpr`. `BUF` and `assign` produce no gate — they add a wire alias resolved by a fixpoint sweep in `IdAssignment`.

`scd/README.md` is the authoritative spec: required port names (`clk`, `rst`, `g_init`, `e_init`, `g_input`, `e_input`, `o`), the wire-index ordering, and the 7-line `.scd` layout. Gate type constants are in `util/common.h`. Circuits are *sequential* — a small combinational core is re-evaluated over `--clock_cycles` with DFF state, which is TinyGarble's core idea; `g_input`/`e_input`/`o` widths are per-clock-cycle, `g_init`/`e_init` are read only at cycle 0.

## Garbling internals

`garbled_circuit/garbled_circuit.cpp` holds `GarbleStr`/`EvaluateStr` — the entry points that do socket setup, OT, and then dispatch on `low_mem_foot && clock_cycles > 1` to one of two full implementations of the same protocol:

- `garbled_circuit_high_mem.cpp` — expands all clock cycles up front, one OT round. Faster, memory grows with cycles.
- `garbled_circuit_low_mem.cpp` — OT per clock cycle. Slower, constant memory.

Changes to garbling semantics almost always need to be made in **both** files; they do not share a core loop.

Protocol optimizations are compile-time `#define`s in `util/common.h` (`ROW_REDUCTION`, `FREE_XOR`, `DKC2`), not runtime flags. Labels are `block` (128-bit `__m128i`); `crypto/aes.h` is the fixed-key blockcipher. `crypto/OT.cpp` is base OT (OpenSSL BIGNUM, `crypto/BN.cpp`), `crypto/OT_extension.cpp` is the extension layer used in practice. `--disable_OT` exists for benchmarking only and is insecure.

Wire values use negative sentinels, not a tag field: `SECRET`/`SECRET_INV` in `garbled_circuit_util.h`, `CONST_ZERO`/`CONST_ONE` in `util/common.h`, `DFFGATE = -1`. Guard with `IsSecret(x)` rather than comparing to a specific constant.

## Cross-checking without two terminals

`scd/SCD_Evaluator_Main` evaluates an `.scd` in the clear on plaintext inputs. It is the reference oracle: if garbled output disagrees with it, the bug is in `garbled_circuit/`, not the circuit. Use it whenever a circuit or protocol change gives a suspicious answer.

## ARM2GC (`a23/`)

A second front end: instead of synthesizing a function, it garbles an ARM (Amber A23) processor circuit and feeds it compiled ARM machine code as public input. `a23/<benchmark>/Makefile` (via `a23/include/common.mk`, requires `gcc-arm-linux-gnueabi` + `binutils-arm-linux-gnueabi`) compiles the C source and emits instructions to `p.txt`, passed as `--p_init` alongside `a23_gc_main_64_w_n_cc.scd`. Per-party secret data lives in `<benchmark>/test/g.txt` and `e.txt`, given via `--init`. See `a23/README.md` for exact invocations.

## Options drift

`README.md`'s option listings are stale. `garbled_circuit/garbled_circuit_main.cpp` is the source of truth — it has `--p_init`, `--p_input`, `-t/--terminate_period`, and accepts named `--output_mode` values (`consecutive`, `separated_clock`, `last_clock`) that the README doesn't mention. Both `--init`/`--input` and `--p_init`/`--p_input` accept either a hex string or a file path (`ReadFileOrPassHex` in `util/util.h`). Alice and Bob exchange and compare their options at startup (`CheckOptionsAlice`/`CheckOptionsBob`) and abort on mismatch, so an option added to one side must be added to that handshake too.

## Benchmarking

`garbled_circuit/eval_TinyGarble` forks Alice and Bob and times runs listed in `scd/benchmarks.txt.in` (columns: scd path, cycles, output_mode, label, bit width). It is a no-op unless `TIMING_EVAL` is set to 1 in `garbled_circuit/garbled_circuit_util.h` and the tree is rebuilt.

## Conventions

- `LOG(INFO)`/`LOG(ERROR)` from `util/log.h`, compiled out entirely when `ENABLE_LOG` is off. Same for `DUMP` under `ENABLE_DUMP`.
- Functions return `SUCCESS`/`FAILURE` (0/-1) and callers wrap them in the `CHECK`/`CHECK_EXPR`/`BN_CHECK` macros, which log and `return FAILURE`. Follow that pattern instead of throwing.
- Sources are `snake_case.cpp`, functions `CamelCase`. Each `.cpp` becomes a cmake OBJECT library named `<Dir>_<Name>` and is linked into executables via `$<TARGET_OBJECTS:...>`; adding a source means adding both the `add_library` and every consuming `add_executable` list.
- GPLv3, inherited from JustGarble (see `README-JustGarble`). Keep the license header on new files.
