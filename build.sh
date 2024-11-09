#!/bin/bash

can_windows=$(command -v x86_64-w64-mingw32-gcc &> /dev/null && echo true || echo false)
if [ "$can_windows" == "false" ]; then
    echo "Can't compile windows version due to no MinGW detected"
fi

mkdir -p build
mkdir -p build/linux
mkdir -p build/windows
rm -f build/linux/*
rm -f build/windows/*

gcc -m64 -O0 -g3 -fno-inline -funroll-loops -flto -ftree-vectorize src/main.c -o "build/linux/Password Generator"
if [ $? -ne 0 ]; then
    echo "Failed to link the Linux executable"
    exit 1
fi

if [ "$can_windows" == "true" ]; then
    x86_64-w64-mingw32-gcc -m64 -O0 -g3 -fno-inline -funroll-loops -flto -ftree-vectorize src/main.c -o "build/windows/Password Generator.exe"
    if [ $? -ne 0 ]; then
        echo "Failed to compile Windows executable"
        exit 1
    fi
fi

echo "Compilation successful."
