#!/bin/bash

mkdir -p bin
cd bin
cmake -D CMAKE_BUILD_TYPE=Release .. 
echo "Config is done. Now call 'make' in 'bin' directory to compile TinyGarble."


