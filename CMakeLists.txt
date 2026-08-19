cmake_minimum_required (VERSION 3.5...3.31 FATAL_ERROR)
project (TinyGarble
  VERSION 3.0.0
  LANGUAGES CXX)

##############
if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
  if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS "4.6.3")
    message(FATAL_ERROR "Insufficient gcc version, should be at least 4.6.3")
  endif()
endif()

#############
enable_testing()
include_directories (${CMAKE_CURRENT_SOURCE_DIR})
include_directories(${PROJECT_BINARY_DIR})

##############
# build type
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug)
endif()

if (CMAKE_BUILD_TYPE MATCHES Debug)
  message("Debug build.")
elseif (CMAKE_BUILD_TYPE MATCHES Release)
  message("Release build.")
else()
  message("Some other build type.")
endif ()

###############
# Compiler flags
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wno-strict-aliasing")

# The garbling core needs 128-bit vectors and hardware AES. On x86-64 that is
# SSE + AES-NI; on AArch64 it is NEON + the ARMv8 crypto extensions, reached
# through crypto/neon_compat.h. Apple silicon has crypto in the baseline, other
# AArch64 targets need it requested explicitly.
include(CheckCXXCompilerFlag)
if (CMAKE_SYSTEM_PROCESSOR MATCHES "^(aarch64|arm64|ARM64)$")
  check_cxx_compiler_flag("-march=armv8-a+crypto" HAVE_ARMV8_CRYPTO_FLAG)
  if (HAVE_ARMV8_CRYPTO_FLAG)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=armv8-a+crypto")
  endif()
else()
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native")
endif()

# set -lrt for minunit testing lib. macOS has clock_gettime in libc, no librt.
if (UNIX AND NOT APPLE)
  set(CMAKE_CXX_STANDARD_LIBRARIES "-lrt -lpthread -ldl")
elseif (APPLE)
  set(CMAKE_CXX_STANDARD_LIBRARIES "-lpthread -ldl")
endif ()

set (CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O0 -g -DDEBUG")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -O3 -DNDEBUG")

###############
# Library

## Boost
set (Boost_USE_STATIC_LIBS OFF)
set (Boost_USE_MULTITHREADED ON)
set (Boost_USE_STATIC_RUNTIME OFF)
find_package (Boost 1.45.0
  REQUIRED
  COMPONENTS program_options)

if (Boost_FOUND)
  include_directories (${Boost_INCLUDE_DIRS})
endif (Boost_FOUND)

## OpenSSL
find_package (OpenSSL)

if (OPENSSL_FOUND)
	include_directories (${OPENSSL_INCLUDE_DIR})
endif (OPENSSL_FOUND)

###############
# Options
option (ENABLE_DUMP "Enable dump hex feature" OFF)
option (ENABLE_LOG "Enable log feature" OFF)
if (CMAKE_BUILD_TYPE MATCHES Debug)
	message("Turn Log on.")
	SET(ENABLE_LOG ON BOOL "Turn on logs in debug mode.")
endif (CMAKE_BUILD_TYPE MATCHES Debug)

# configure a header file to pass some of the CMake settings
# to the source code
configure_file (
  "util/tinygarble_config.h.in"
  "util/tinygarble_config.h")
###############
# Subdirectory
add_subdirectory ("a23")
add_subdirectory ("crypto")
add_subdirectory ("garbled_circuit")
add_subdirectory ("scd")
add_subdirectory ("tcpip")
add_subdirectory ("util")
