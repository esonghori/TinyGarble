add wave \
sim:/a23_testbench/clk \
sim:/a23_testbench/rst \
sim:/a23_testbench/cc \
sim:/a23_testbench/terminate \
sim:/a23_testbench/u_a23_gc_main/u_a23_core/u_execute/u_register_bank/r0 \
sim:/a23_testbench/u_a23_gc_main/u_a23_core/u_execute/u_register_bank/r1 \
sim:/a23_testbench/u_a23_gc_main/u_a23_core/u_execute/u_register_bank/r2 \
sim:/a23_testbench/u_a23_gc_main/u_a23_core/u_execute/u_register_bank/r3 \
sim:/a23_testbench/u_a23_gc_main/u_a23_core/u_execute/u_register_bank/r4 \
sim:/a23_testbench/u_a23_gc_main/u_a23_core/u_execute/u_register_bank/r5 \
sim:/a23_testbench/u_a23_gc_main/u_a23_core/u_execute/u_register_bank/r6 \
sim:/a23_testbench/u_a23_gc_main/u_a23_core/u_execute/u_register_bank/r7 \
sim:/a23_testbench/u_a23_gc_main/u_a23_core/u_execute/u_register_bank/r8 \
sim:/a23_testbench/u_a23_gc_main/u_a23_core/u_execute/u_register_bank/r9 \
sim:/a23_testbench/u_a23_gc_main/u_a23_core/u_execute/u_register_bank/r10 \
sim:/a23_testbench/u_a23_gc_main/u_a23_core/u_execute/u_register_bank/r11 \
sim:/a23_testbench/u_a23_gc_main/u_a23_core/u_execute/u_register_bank/r12 \
sim:/a23_testbench/u_a23_gc_main/u_a23_core/u_execute/u_register_bank/r13_rds \
sim:/a23_testbench/u_a23_gc_main/u_a23_core/u_execute/u_register_bank/r14_rds \
sim:/a23_testbench/u_a23_gc_main/u_a23_core/u_execute/u_register_bank/r15_out_rn \
sim:/a23_testbench/u_a23_gc_main/u_a23_mem/p_mem \
sim:/a23_testbench/u_a23_gc_main/u_a23_mem/g_mem \
sim:/a23_testbench/u_a23_gc_main/u_a23_mem/e_mem \
sim:/a23_testbench/u_a23_gc_main/u_a23_mem/stack_mem \
sim:/a23_testbench/u_a23_gc_main/u_a23_mem/out_mem \
sim:/a23_testbench/u_a23_gc_main/u_a23_core/u_decode/instruction \
sim:/a23_testbench/u_a23_gc_main/u_a23_core/u_decode/control_state \
sim:/a23_testbench/u_a23_gc_main/u_a23_core/u_decode/instruction_valid \
sim:/a23_testbench/u_a23_gc_main/u_a23_core/u_execute/execute

run -all
exit