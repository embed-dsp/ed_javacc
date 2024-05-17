
# Compile and Install of the JavaCC Tool

This repository contains a **make** file for easy compile and install of [JavaCC]( https://javacc.github.io/javacc ).

The Java Compiler Compiler (JavaCC) is a lexer and parser generator for use with Java applications.

This **make** file can build the JavaCC tool on the following systems:
* Linux
* Windows
    * [MSYS2](https://www.msys2.org)/mingw64
    * [MSYS2](https://www.msys2.org)/mingw32


# Prerequisites

## Java JDK 11
Download from
```bash
https://adoptium.net/temurin/releases/?version=11
```

Install into your system
```bash
# Linux
/opt/java/openjdk/linux_x86_64/jdk-11.0.23+9

# Windows
c:\opt\java\openjdk\x86_64\jdk-11.0.23+9
```

Set **JAVA_HOME** environment variable
```bash
# Linux
export JAVA_HOME=/opt/java/openjdk/linux_x86_64/jdk-11.0.23+9

# MSYS2/mingw
export JAVA_HOME=/c/opt/java/openjdk/x86_64/jdk-11.0.23+9
```

## Apache Ant 1.10.14
Download from
```bash
https://ant.apache.org/bindownload.cgi
```

Install into your system
```bash
# Linux
/opt/apache-ant/apache-ant-1.10.14

# Windows
c:\opt\apache-ant\apache-ant-1.10.14
```

# Get Source Code

## ed_javacc

```bash
git clone https://github.com/embed-dsp/ed_javacc.git
```

```bash
# Enter the ed_javacc directory.
cd ed_javacc

# Edit the Makefile for selecting the JavaCC source version.
vim Makefile
PACKAGE_VERSION = 7.0.13
```

```bash
# Download JavaCC source package into src/ directory.
make download
```


# Build

```bash
# Unpack source code into build/ directory.
make prepare
```

```bash
# Compile source code.
make compile
```


# Install

## Linux

```bash
# Install build products.
sudo make install
```

## Windows: MSYS2/mingw64 & MSYS2/mingw32
```bash
# Install build products.
make install
```
