cmake_minimum_required (VERSION 3.1.0 FATAL_ERROR)
project (TinyGarble 
  VERSION 0.2.0
  LANGUAGES CXX)

###############
# Compiler flags
set(CMAKE_CXX_FLAGS 
  "${CMAKE_CXX_FLAGS} -Wall -Wno-strict-aliasing -march=native")

set (CMAKE_CXX_STANDARD 11)

###############
# Library
set (Boost_USE_STATIC_LIBS OFF)
set (Boost_USE_MULTITHREADED ON)
set (Boost_USE_STATIC_RUNTIME OFF)
find_package (Boost 1.45.0 
  REQUIRED
  COMPONENTS program_options)

if (Boost_FOUND)
  include_directories (${Boost_INCLUDE_DIRS})
endif (Boost_FOUND)

include_directories (${CMAKE_CURRENT_SOURCE_DIR})

###############
# Options
option (DEBUG "Set debug flag" OFF)
option (DUMP_HEX "Enable dump hex feature" OFF)

if (DEBUG)
  set (CMAKE_BUILD_TYPE Debug)
else (DEBUG)
  set (CMAKE_BUILD_TYPE Release)
endif (DEBUG)
# configure a header file to pass some of the CMake settings
# to the source code
configure_file (
  "util/tinygarble_config.h.in"
  "util/tinygarble_config.h")
 
###############
# Subdirectory
add_subdirectory ("garbled_circuit")
add_subdirectory ("scd")
add_subdirectory ("util")
add_subdirectory ("tcpip")
