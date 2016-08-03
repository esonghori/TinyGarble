#define G_SIZE 2 // size of Garbler's input array
#define E_SIZE 2 // size of Evaluator's input array
#define O_SIZE 8 // size of output array

/* sha3.c - an implementation of Secure Hash Algorithm 3 (Keccak).
 * based on the
 * The Keccak SHA-3 submission. Submission to NIST (Round 3), 2011
 * by Guido Bertoni, Joan Daemen, Michaël Peeters and Gilles Van Assche
 *
 * Copyright: 2013 Aleksey Kravchenko <rhash.admin@gmail.com>
 *
 * Permission is hereby granted,  free of charge,  to any person  obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction,  including without limitation
 * the rights to  use, copy, modify,  merge, publish, distribute, sublicense,
 * and/or sell copies  of  the Software,  and to permit  persons  to whom the
 * Software is furnished to do so.
 *
 * This program  is  distributed  in  the  hope  that it will be useful,  but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.  Use this program  at  your own risk!
 */

//#include <string.h>
#include "ustd.h"

static void *memset (void * s, int c, size_t n) {
  unsigned char* p = (unsigned char*)s;
  while(n--)
    *p++ = (unsigned char)c;
  return p;
}
static void *memcpy(void *dest, const void *src, size_t n) {
  char *dp = (char*)dest;
  const char *sp = (const char *)src;
  while (n--)
    *dp++ = *sp++;
  return dest;
}

//#include <assert.h>

#include "byte_order.h"

#define sha3_256_hash_size  32
#define sha3_max_permutation_size 25
#define sha3_256_rate_in_qwords 17

/**
 * SHA3 Algorithm context.
 */
typedef struct sha3_ctx {
  /* 1600 bits algorithm hashing state */
  uint64_t hash[sha3_max_permutation_size];
  /* 1536-bit buffer for leftovers */
  uint64_t message[sha3_256_rate_in_qwords];
  /* count of bytes in the message[] buffer */
  uint32_t rest;
  /* size of a message block processed at once */
  // unsigned block_size; == 136 for sha3-256
} sha3_ctx;

static sha3_ctx ctx;

/* constants */
#define NumberOfRounds 24

/* SHA3 (Keccak) constants for 24 rounds */
static uint64_t keccak_round_constants[NumberOfRounds] = {
  I64(0x0000000000000001), I64(0x0000000000008082), I64(0x800000000000808A), I64(0x8000000080008000),
  I64(0x000000000000808B), I64(0x0000000080000001), I64(0x8000000080008081), I64(0x8000000000008009),
  I64(0x000000000000008A), I64(0x0000000000000088), I64(0x0000000080008009), I64(0x000000008000000A),
  I64(0x000000008000808B), I64(0x800000000000008B), I64(0x8000000000008089), I64(0x8000000000008003),
  I64(0x8000000000008002), I64(0x8000000000000080), I64(0x000000000000800A), I64(0x800000008000000A),
  I64(0x8000000080008081), I64(0x8000000000008080), I64(0x0000000080000001), I64(0x8000000080008008)
};

/**
 * Initialize context before calculating hash.
 *
 */
static void rhash_sha3_256_init() {
  // memset(&ctx, 0, sizeof(sha3_ctx));
}
#define BLOCK_SIZE 136

/* Keccak theta() transformation */
static uint64_t C[5], D[5];
static void keccak_theta(uint64_t *A) {
  unsigned int x;
  
  for (x = 0; x < 5; x++) {
    C[x] = A[x] ^ A[x + 5] ^ A[x + 10] ^ A[x + 15] ^ A[x + 20];
  }
  D[0] = ROTL64(C[1], 1) ^ C[4];
  D[1] = ROTL64(C[2], 1) ^ C[0];
  D[2] = ROTL64(C[3], 1) ^ C[1];
  D[3] = ROTL64(C[4], 1) ^ C[2];
  D[4] = ROTL64(C[0], 1) ^ C[3];

  for (x = 0; x < 5; x++) {
    A[x]      ^= D[x];
    A[x + 5]  ^= D[x];
    A[x + 10] ^= D[x];
    A[x + 15] ^= D[x];
    A[x + 20] ^= D[x];
  }
}

/* Keccak pi() transformation */
static void keccak_pi(uint64_t *A) {
  uint64_t A1;
  A1 = A[1];
  A[ 1] = A[ 6];
  A[ 6] = A[ 9];
  A[ 9] = A[22];
  A[22] = A[14];
  A[14] = A[20];
  A[20] = A[ 2];
  A[ 2] = A[12];
  A[12] = A[13];
  A[13] = A[19];
  A[19] = A[23];
  A[23] = A[15];
  A[15] = A[ 4];
  A[ 4] = A[24];
  A[24] = A[21];
  A[21] = A[ 8];
  A[ 8] = A[16];
  A[16] = A[ 5];
  A[ 5] = A[ 3];
  A[ 3] = A[18];
  A[18] = A[17];
  A[17] = A[11];
  A[11] = A[ 7];
  A[ 7] = A[10];
  A[10] = A1;
  /* note: A[ 0] is left as is */
}

/* Keccak chi() transformation */
static void keccak_chi(uint64_t *A) {
  int i;
  for (i = 0; i < 25; i += 5) {
    uint64_t A0 = A[0 + i], A1 = A[1 + i];
    A[0 + i] ^= ~A1 & A[2 + i];
    A[1 + i] ^= ~A[2 + i] & A[3 + i];
    A[2 + i] ^= ~A[3 + i] & A[4 + i];
    A[3 + i] ^= ~A[4 + i] & A0;
    A[4 + i] ^= ~A0 & A1;
  }
}

static void rhash_sha3_permutation(uint64_t *state) {
  int round;
  for (round = 0; round < NumberOfRounds; round++) {
    keccak_theta(state);

    /* apply Keccak rho() transformation */
    state[ 1] = ROTL64(state[ 1],  1);
    state[ 2] = ROTL64(state[ 2], 62);
    state[ 3] = ROTL64(state[ 3], 28);
    state[ 4] = ROTL64(state[ 4], 27);
    state[ 5] = ROTL64(state[ 5], 36);
    state[ 6] = ROTL64(state[ 6], 44);
    state[ 7] = ROTL64(state[ 7],  6);
    state[ 8] = ROTL64(state[ 8], 55);
    state[ 9] = ROTL64(state[ 9], 20);
    state[10] = ROTL64(state[10],  3);
    state[11] = ROTL64(state[11], 10);
    state[12] = ROTL64(state[12], 43);
    state[13] = ROTL64(state[13], 25);
    state[14] = ROTL64(state[14], 39);
    state[15] = ROTL64(state[15], 41);
    state[16] = ROTL64(state[16], 45);
    state[17] = ROTL64(state[17], 15);
    state[18] = ROTL64(state[18], 21);
    state[19] = ROTL64(state[19],  8);
    state[20] = ROTL64(state[20], 18);
    state[21] = ROTL64(state[21],  2);
    state[22] = ROTL64(state[22], 61);
    state[23] = ROTL64(state[23], 56);
    state[24] = ROTL64(state[24], 14);

    keccak_pi(state);
    keccak_chi(state);

    /* apply iota(state, round) */
    *state ^= keccak_round_constants[round];
  }
}

/**
 * The core transformation. Process the specified block of data for sha3-256.
 *
 */
static void rhash_sha3_256_process_block() {
  /* expanded loop */
  ctx.hash[ 0] ^= le2me_64(ctx.message[ 0]);
  ctx.hash[ 1] ^= le2me_64(ctx.message[ 1]);
  ctx.hash[ 2] ^= le2me_64(ctx.message[ 2]);
  ctx.hash[ 3] ^= le2me_64(ctx.message[ 3]);
  ctx.hash[ 4] ^= le2me_64(ctx.message[ 4]);
  ctx.hash[ 5] ^= le2me_64(ctx.message[ 5]);
  ctx.hash[ 6] ^= le2me_64(ctx.message[ 6]);
  ctx.hash[ 7] ^= le2me_64(ctx.message[ 7]);
  ctx.hash[ 8] ^= le2me_64(ctx.message[ 8]);
  ctx.hash[ 9] ^= le2me_64(ctx.message[ 9]);
  ctx.hash[10] ^= le2me_64(ctx.message[10]);
  ctx.hash[11] ^= le2me_64(ctx.message[11]);
  ctx.hash[12] ^= le2me_64(ctx.message[12]);
  ctx.hash[13] ^= le2me_64(ctx.message[13]);
  ctx.hash[14] ^= le2me_64(ctx.message[14]);
  ctx.hash[15] ^= le2me_64(ctx.message[15]);
  ctx.hash[16] ^= le2me_64(ctx.message[16]);
  /* make a permutation of the hash */
  rhash_sha3_permutation(ctx.hash);
}

#define SHA3_FINALIZED 0x80000000

//  compute a%b
static uint32_t mod(uint32_t a, uint32_t b) { 
  while(a > b) 
    a -= b;
  return a;
} 

/**
 * Calculate message hash.
 * Can be called repeatedly with chunks of the message to be hashed.
 * This sha3 method is crippled and only accepted message less than
 * BLOCK_SIZE.
 *
 * @param msg message chunk
 * @param size length of the message chunk
 */
static void rhash_sha3_update(const unsigned char *msg, size_t size) {
  size_t index = ctx.rest;

  //if (ctx.rest & SHA3_FINALIZED) return; /* too late for additional input */
  //ctx.rest = (unsigned)((ctx.rest + size) % BLOCK_SIZE);
  ctx.rest = mod(ctx.rest + size, BLOCK_SIZE);

  /* fill partial block */
  if (index) {
    size_t left = BLOCK_SIZE - index;
    memcpy((char*)ctx.message + index, msg, (size < left ? size : left));
    if (size < left) return;

    /* process partial block */
    // rhash_sha3_256_process_block();
    // msg  += left;
    // size -= left;
  }
  // while (size >= BLOCK_SIZE) {
  //   // always aligned for g and e.
  //   // uint64_t* aligned_message_block;
  //   // if (IS_ALIGNED_64(msg)) {
  //   //    // the most common case is processing of an already aligned message
  //   //   //  without copying it 
  //   //   aligned_message_block = (uint64_t*)msg;
  //   // } else {
  //   //   memcpy(ctx.message, msg, BLOCK_SIZE);
  //   //   aligned_message_block = ctx.message;
  //   // }

  //   rhash_sha3_256_process_block();
  //   msg  += BLOCK_SIZE;
  //   size -= BLOCK_SIZE;
  // }
  if (size) {
    memcpy(ctx.message, msg, size); /* save leftovers */
  }
}

/**
 * Store calculated hash into the given array.
 *
 * @param result calculated hash in binary form
 */
static void rhash_sha3_final(unsigned char* result) {
  // for sha3-256: digest_length = 100 - 136/2 = 32 byte
  size_t digest_length = 100 - BLOCK_SIZE / 2;

  //if (!(ctx.rest & SHA3_FINALIZED)) {
    /* clear the rest of the data queue */
    memset((char*)ctx.message + ctx.rest, 0, BLOCK_SIZE - ctx.rest);
    ((char*)ctx.message)[ctx.rest] |= 0x06;
    ((char*)ctx.message)[BLOCK_SIZE - 1] |= 0x80;

    /* process final block */
    rhash_sha3_256_process_block();
    //ctx.rest = SHA3_FINALIZED; /* mark context as finalized */
  //}

  //assert(BLOCK_SIZE > digest_length);
  //if (result) 
  me64_to_le_str(result, ctx.hash, digest_length);
}

void gc_main(const int *g,  // Garbler's input array
    const int *e,           // Evaluator's input array
    int *o                  // output array
    ) {

  rhash_sha3_256_init(); 
  rhash_sha3_update((const unsigned char *)g, G_SIZE*sizeof(int));
  rhash_sha3_update((const unsigned char *)e, E_SIZE*sizeof(int));
  rhash_sha3_final((unsigned char*) o);

}