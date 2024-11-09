#!/bin/bash

can_windows=$(command -v x86_64-w64-mingw32-gcc &> /dev/null && echo true || echo false)
if [ "$can_windows" == "false" ]; then
    echo "Can't compile windows version due to no MinGW detected"
fi

rm -rf build
mkdir -p build
mkdir -p build/linux
mkdir -p build/linux/x64
mkdir -p build/linux/x86
mkdir -p build/windows
mkdir -p build/windows/x64
mkdir -p build/windows/x86

gcc -m64 -O0 -g3 -fno-inline -funroll-loops -flto -ftree-vectorize src/main.c -o "build/linux/x64/Password Generator"
if [ $? -ne 0 ]; then
    echo "Failed to link the Linux x64 executable"
    exit 1
else
    zip -r -9 build/linux-x64.zip build/linux/x64/Password\ Generator
fi

gcc -m32 -O0 -g3 -fno-inline -funroll-loops -flto -ftree-vectorize src/main.c -o "build/linux/x86/Password Generator"
if [ $? -ne 0 ]; then
    echo "Failed to link the Linux x86 executable"
    exit 1
else
    zip -r -9 build/linux-x86.zip build/linux/x86/Password\ Generator
fi

if [ "$can_windows" == "true" ]; then
    x86_64-w64-mingw32-gcc -m64 -O0 -g3 -fno-inline -funroll-loops -flto -ftree-vectorize src/main.c -o "build/windows/x64/Password Generator.exe"
    if [ $? -ne 0 ]; then
        echo "Failed to compile Windows x64 executable"
        exit 1
    else
        zip -r -9 build/windows-x64.zip build/linux/x64/Password\ Generator
    fi

    i686-w64-mingw32-gcc -O0 -g3 -fno-inline -funroll-loops -flto -ftree-vectorize src/main.c -o "build/windows/x86/Password Generator.exe"
    if [ $? -ne 0 ]; then
        echo "Failed to compile Windows x32 executable"
        exit 1
    else
        zip -r -9 build/windows-x86.zip build/linux/x86/Password\ Generator
    fi
fi

echo "Compilation successful."
