# Password Generator

A cross-platform password generator written in C, designed for both Windows and Linux, with support for x64 and x86.

## Building

### On Linux

To build the application, run the `build.sh` script. It will generate executables for both Linux and Windows in the `build/` directory.

```bash
./build.sh
```

If it fails, install the required dependencies.

```bash
sudo apt update
sudo apt install -y build-essential gcc gcc-multilib mingw-w64 zip
```

### Manually (if not using `build.sh`)

You can manually compile the application on Linux with the following steps:

#### x64 version

Use the following command to compile for Linux:

```bash
gcc -m64 -O0 -g3 -fno-inline -funroll-loops -flto -ftree-vectorize src/main.c -o "Password Generator"
```

To compile for Windows, you can cross-compile with tools like MinGW. The command may look like this:

```bash
x86_64-w64-mingw32-gcc -m64 -O0 -g3 -fno-inline -funroll-loops -flto -ftree-vectorize src/main.c -o "Password Generator.exe"
```

#### x86 version

Use the following command to compile for Linux:

```bash
gcc -m32 -O0 -g3 -fno-inline -funroll-loops -flto -ftree-vectorize src/main.c -o "Password Generator"
```

To compile for Windows, you can cross-compile with tools like MinGW. The command may look like this:

```bash
i686-w64-mingw32-gcc -O0 -g3 -fno-inline -funroll-loops -flto -ftree-vectorize src/main.c -o "build/windows/x86/Password Generator.exe"
```

This should generate executables for both Linux and Windows.
