/*
 This file is part of TinyGarble.

 TinyGarble is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 TinyGarble is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with TinyGarble.  If not, see <http://www.gnu.org/licenses/>.
 */

/**
 * @file neon_compat.h
 * @brief The subset of SSE2/SSSE3/SSE4.1/AES-NI that TinyGarble uses, mapped
 * onto ARM NEON and the ARMv8 crypto extensions.
 *
 * TinyGarble's garbling core is written against x86 intrinsics: a wire label is
 * an `__m128i` and the fixed-key blockcipher is AES-NI. This header lets the
 * same source build on AArch64 without touching it, so there is one
 * implementation of the protocol rather than two.
 *
 * Only the intrinsics this codebase actually references are here. It is not a
 * general-purpose SSE emulation layer; if you use a new intrinsic, add it.
 *
 * Results are bit-identical to the x86 originals, which matters beyond
 * self-consistency: an x86 garbler and an ARM evaluator must agree on every
 * label, so "close enough" would fail at runtime with two machines and pass
 * every single-machine test.
 *
 * Requires the ARMv8 crypto extensions (`+crypto`). These are baseline on
 * Apple silicon and present on essentially all AArch64 application cores, but
 * are optional in the architecture.
 */

#ifndef CRYPTO_NEON_COMPAT_H_
#define CRYPTO_NEON_COMPAT_H_

#if !defined(__aarch64__) && !defined(_M_ARM64)
#error "neon_compat.h is for AArch64 only; x86 builds include the real intrinsics"
#endif

#include <arm_neon.h>
#include <cstdint>
#include <cstdlib>

typedef int64x2_t __m128i;
/* Only ever produced by the cast intrinsics below to feed _mm_shuffle_ps, so
 * making it the same type keeps the casts free and the shuffle exact. */
typedef int64x2_t __m128;
typedef int64_t __m64;

/* ---------- reinterpretation helpers ---------- */

#define NC_U8(x) vreinterpretq_u8_s64(x)
#define NC_S32(x) vreinterpretq_s32_s64(x)
#define NC_U32(x) vreinterpretq_u32_s64(x)
#define NC_U64(x) vreinterpretq_u64_s64(x)
#define NC_FROM_U8(x) vreinterpretq_s64_u8(x)
#define NC_FROM_S32(x) vreinterpretq_s64_s32(x)
#define NC_FROM_U32(x) vreinterpretq_s64_u32(x)
#define NC_FROM_U64(x) vreinterpretq_s64_u64(x)

#define _MM_SHUFFLE(fp3, fp2, fp1, fp0) \
  (((fp3) << 6) | ((fp2) << 4) | ((fp1) << 2) | (fp0))

/* ---------- bitwise and constants ---------- */

static inline __m128i _mm_setzero_si128(void) {
  return vdupq_n_s64(0);
}

static inline __m128i _mm_xor_si128(__m128i a, __m128i b) {
  return NC_FROM_U8(veorq_u8(NC_U8(a), NC_U8(b)));
}

static inline __m128i _mm_and_si128(__m128i a, __m128i b) {
  return NC_FROM_U8(vandq_u8(NC_U8(a), NC_U8(b)));
}

static inline __m128i _mm_or_si128(__m128i a, __m128i b) {
  return NC_FROM_U8(vorrq_u8(NC_U8(a), NC_U8(b)));
}

static inline __m128i _mm_set_epi32(int e3, int e2, int e1, int e0) {
  int32_t v[4] = { e0, e1, e2, e3 };
  return NC_FROM_S32(vld1q_s32(v));
}

/* x86 takes __m64 operands, hi first. */
static inline __m128i _mm_set_epi64(__m64 e1, __m64 e0) {
  int64_t v[2] = { (int64_t) e0, (int64_t) e1 };
  return vld1q_s64(v);
}

static inline __m128i _mm_set_epi8(signed char e15, signed char e14,
                                   signed char e13, signed char e12,
                                   signed char e11, signed char e10,
                                   signed char e9, signed char e8,
                                   signed char e7, signed char e6,
                                   signed char e5, signed char e4,
                                   signed char e3, signed char e2,
                                   signed char e1, signed char e0) {
  int8_t v[16] = { e0, e1, e2, e3, e4, e5, e6, e7,
                   e8, e9, e10, e11, e12, e13, e14, e15 };
  return vreinterpretq_s64_s8(vld1q_s8(v));
}

/* ---------- loads and stores (AArch64 permits unaligned) ---------- */

static inline __m128i _mm_load_si128(const __m128i *p) {
  return vld1q_s64((const int64_t *) p);
}

static inline __m128i _mm_loadu_si128(const __m128i *p) {
  return vld1q_s64((const int64_t *) p);
}

static inline void _mm_store_si128(__m128i *p, __m128i a) {
  vst1q_s64((int64_t *) p, a);
}

static inline void *_mm_malloc(size_t size, size_t align) {
  void *ptr = nullptr;
  if (align < sizeof(void *)) {
    align = sizeof(void *);
  }
  if (posix_memalign(&ptr, align, size) != 0) {
    return nullptr;
  }
  return ptr;
}

static inline void _mm_free(void *ptr) {
  free(ptr);
}

/* ---------- arithmetic ---------- */

static inline __m128i _mm_add_epi32(__m128i a, __m128i b) {
  return NC_FROM_S32(vaddq_s32(NC_S32(a), NC_S32(b)));
}

static inline __m128i _mm_add_epi64(__m128i a, __m128i b) {
  return vaddq_s64(a, b);
}

/* Multiplies the two even-indexed 32-bit lanes into 64-bit results. */
static inline __m128i _mm_mul_epu32(__m128i a, __m128i b) {
  uint32x2_t ea = vmovn_u64(NC_U64(a));
  uint32x2_t eb = vmovn_u64(NC_U64(b));
  return NC_FROM_U64(vmull_u32(ea, eb));
}

/* Shift counts may be variable, so these use the register form rather than
 * the immediate form. A negative count on vshlq is a shift right, arithmetic
 * for signed lane types. */
static inline __m128i _mm_slli_epi32(__m128i a, int count) {
  if (count < 0 || count > 31) return _mm_setzero_si128();
  return NC_FROM_S32(vshlq_s32(NC_S32(a), vdupq_n_s32(count)));
}

static inline __m128i _mm_slli_epi64(__m128i a, int count) {
  if (count < 0 || count > 63) return _mm_setzero_si128();
  return vshlq_s64(a, vdupq_n_s64(count));
}

static inline __m128i _mm_srai_epi32(__m128i a, int count) {
  if (count < 0) return a;
  if (count > 31) count = 31;  /* x86 saturates to a sign fill */
  return NC_FROM_S32(vshlq_s32(NC_S32(a), vdupq_n_s32(-count)));
}

/* ---------- comparison and extraction ---------- */

static inline __m128i _mm_cmpeq_epi64(__m128i a, __m128i b) {
  return NC_FROM_U64(vceqq_u64(NC_U64(a), NC_U64(b)));
}

/* imm must be a compile-time constant, as on x86. */
#define _mm_extract_epi16(a, imm) \
  ((int) vgetq_lane_u16(vreinterpretq_u16_s64(a), (imm)))

/* ---------- byte and lane permutation ---------- */

/* Table lookup zeroes any lane whose index exceeds 15, matching pshufb's
 * treatment of a set high bit for the masks used here. */
static inline __m128i _mm_shuffle_epi8(__m128i a, __m128i mask) {
  return NC_FROM_U8(vqtbl1q_u8(NC_U8(a), NC_U8(mask)));
}

/* Selects 32-bit lanes of a single vector; imm is a compile-time constant. */
#define _mm_shuffle_epi32(a, imm)                                        \
  __extension__({                                                        \
    const int32x4_t nc_s = NC_S32(a);                                    \
    int32_t nc_o[4];                                                     \
    nc_o[0] = nc_s[((imm) >> 0) & 0x3];                                  \
    nc_o[1] = nc_s[((imm) >> 2) & 0x3];                                  \
    nc_o[2] = nc_s[((imm) >> 4) & 0x3];                                  \
    nc_o[3] = nc_s[((imm) >> 6) & 0x3];                                  \
    NC_FROM_S32(vld1q_s32(nc_o));                                        \
  })

/* Lanes 0 and 1 come from a, lanes 2 and 3 from b. */
#define _mm_shuffle_ps(a, b, imm)                                        \
  __extension__({                                                        \
    const int32x4_t nc_a = NC_S32(a);                                    \
    const int32x4_t nc_b = NC_S32(b);                                    \
    int32_t nc_o[4];                                                     \
    nc_o[0] = nc_a[((imm) >> 0) & 0x3];                                  \
    nc_o[1] = nc_a[((imm) >> 2) & 0x3];                                  \
    nc_o[2] = nc_b[((imm) >> 4) & 0x3];                                  \
    nc_o[3] = nc_b[((imm) >> 6) & 0x3];                                  \
    NC_FROM_S32(vld1q_s32(nc_o));                                        \
  })

/* Shifts left by imm *bytes*, zero filling. */
#define _mm_slli_si128(a, imm)                                           \
  __extension__({                                                        \
    __m128i nc_r;                                                        \
    if ((imm) <= 0) {                                                    \
      nc_r = (a);                                                        \
    } else if ((imm) > 15) {                                             \
      nc_r = _mm_setzero_si128();                                        \
    } else {                                                             \
      nc_r = NC_FROM_U8(                                                 \
          vextq_u8(vdupq_n_u8(0), NC_U8(a), 16 - ((imm) & 0xF)));        \
    }                                                                    \
    nc_r;                                                                \
  })

#define _mm_castsi128_ps(a) (a)
#define _mm_castps_si128(a) (a)

/* ---------- AES ---------- */

/*
 * ARM and x86 slice an AES round differently. AESE does AddRoundKey then
 * SubBytes and ShiftRows, with MixColumns split out into AESMC; x86's AESENC
 * does ShiftRows, SubBytes, MixColumns and AddRoundKey together. Passing a zero
 * key to AESE and XORing the round key afterwards reproduces x86 exactly.
 */

static inline __m128i _mm_aesenc_si128(__m128i a, __m128i round_key) {
  return NC_FROM_U8(
      veorq_u8(vaesmcq_u8(vaeseq_u8(NC_U8(a), vdupq_n_u8(0))),
               NC_U8(round_key)));
}

static inline __m128i _mm_aesenclast_si128(__m128i a, __m128i round_key) {
  return NC_FROM_U8(
      veorq_u8(vaeseq_u8(NC_U8(a), vdupq_n_u8(0)), NC_U8(round_key)));
}

static inline __m128i _mm_aesdec_si128(__m128i a, __m128i round_key) {
  return NC_FROM_U8(
      veorq_u8(vaesimcq_u8(vaesdq_u8(NC_U8(a), vdupq_n_u8(0))),
               NC_U8(round_key)));
}

static inline __m128i _mm_aesdeclast_si128(__m128i a, __m128i round_key) {
  return NC_FROM_U8(
      veorq_u8(vaesdq_u8(NC_U8(a), vdupq_n_u8(0)), NC_U8(round_key)));
}

static inline __m128i _mm_aesimc_si128(__m128i a) {
  return NC_FROM_U8(vaesimcq_u8(NC_U8(a)));
}

/** The AES S-box (FIPS-197). ARMv8 has no counterpart to AESKEYGENASSIST, so
 * the key schedule helper below is done in software. */
static const uint8_t kNeonCompatAesSbox[256] = {
  0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5,
  0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76,
  0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0,
  0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0,
  0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc,
  0x34, 0xa5, 0xe5, 0xf1, 0x71, 0xd8, 0x31, 0x15,
  0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05, 0x9a,
  0x07, 0x12, 0x80, 0xe2, 0xeb, 0x27, 0xb2, 0x75,
  0x09, 0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0,
  0x52, 0x3b, 0xd6, 0xb3, 0x29, 0xe3, 0x2f, 0x84,
  0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b,
  0x6a, 0xcb, 0xbe, 0x39, 0x4a, 0x4c, 0x58, 0xcf,
  0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85,
  0x45, 0xf9, 0x02, 0x7f, 0x50, 0x3c, 0x9f, 0xa8,
  0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5,
  0xbc, 0xb6, 0xda, 0x21, 0x10, 0xff, 0xf3, 0xd2,
  0xcd, 0x0c, 0x13, 0xec, 0x5f, 0x97, 0x44, 0x17,
  0xc4, 0xa7, 0x7e, 0x3d, 0x64, 0x5d, 0x19, 0x73,
  0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88,
  0x46, 0xee, 0xb8, 0x14, 0xde, 0x5e, 0x0b, 0xdb,
  0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c,
  0xc2, 0xd3, 0xac, 0x62, 0x91, 0x95, 0xe4, 0x79,
  0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5, 0x4e, 0xa9,
  0x6c, 0x56, 0xf4, 0xea, 0x65, 0x7a, 0xae, 0x08,
  0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6, 0xb4, 0xc6,
  0xe8, 0xdd, 0x74, 0x1f, 0x4b, 0xbd, 0x8b, 0x8a,
  0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e,
  0x61, 0x35, 0x57, 0xb9, 0x86, 0xc1, 0x1d, 0x9e,
  0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e, 0x94,
  0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf,
  0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68,
  0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16
};

static inline uint32_t NeonCompatSubWord(uint32_t w) {
  return ((uint32_t) kNeonCompatAesSbox[w & 0xff])
      | ((uint32_t) kNeonCompatAesSbox[(w >> 8) & 0xff] << 8)
      | ((uint32_t) kNeonCompatAesSbox[(w >> 16) & 0xff] << 16)
      | ((uint32_t) kNeonCompatAesSbox[(w >> 24) & 0xff] << 24);
}

static inline uint32_t NeonCompatRotWord(uint32_t w) {
  return (w >> 8) | (w << 24);
}

/**
 * @brief Software AESKEYGENASSIST.
 *
 * Following Intel's definition, with X1 and X3 the second and fourth 32-bit
 * words of @a a:
 *   result word 0 = SubWord(X1)
 *   result word 1 = RotWord(SubWord(X1)) ^ rcon
 *   result word 2 = SubWord(X3)
 *   result word 3 = RotWord(SubWord(X3)) ^ rcon
 */
static inline __m128i NeonCompatAesKeygenAssist(__m128i a, const int rcon) {
  uint32_t w[4];
  vst1q_u32(w, NC_U32(a));

  const uint32_t s1 = NeonCompatSubWord(w[1]);
  const uint32_t s3 = NeonCompatSubWord(w[3]);
  const uint32_t r = (uint32_t) rcon;

  uint32_t o[4];
  o[0] = s1;
  o[1] = NeonCompatRotWord(s1) ^ r;
  o[2] = s3;
  o[3] = NeonCompatRotWord(s3) ^ r;
  return NC_FROM_U32(vld1q_u32(o));
}

#define _mm_aeskeygenassist_si128(a, rcon) NeonCompatAesKeygenAssist((a), (rcon))

#endif /* CRYPTO_NEON_COMPAT_H_ */
