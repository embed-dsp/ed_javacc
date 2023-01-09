
# Compile and Install of the JavaCC Tool

This repository contains a **make** file for easy compile and install of [JavaCC](https://javacc.github.io/javacc).

The Java Compiler Compiler (JavaCC) is a lexer and parser generator for use with Java applications.

This **make** file can build the JavaCC tool on the following systems:
* Linux
* Windows
    * [MSYS2](https://www.msys2.org)/mingw64
    * [MSYS2](https://www.msys2.org)/mingw32
    * [Cygwin](https://www.cygwin.com)


# Get Source Code

## ed_javacc

```bash
git clone https://github.com/embed-dsp/ed_javacc.git
```

## JavaCC

```bash
# Enter the ed_javacc directory.
cd ed_javacc

# Edit the Makefile for selecting the JavaCC source version.
vim Makefile
PACKAGE_VERSION = 7.0.12
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

```bash
# Install build products.
# linux, ...
sudo make install

# Install build products.
# mingw64, mingw32, cygwin, ...
make install
```

# Prerequisites

## Java JDK 8
Download from
```bash
https://adoptium.net/temurin/releases/?version=8
```

Install into your system
```bash
# Linux
/opt/java/openjdk/linux_x86_64/jdk8u352-b08

# Windows
c:\opt\java\openjdk\x86_64\jdk8u352-b08
```

Set **JAVA_HOME** environment variable
```bash

# Linux
export JAVA_HOME=/opt/java/openjdk/linux_x86_64/jdk8u352-b08

# MSYS2/mingw
export JAVA_HOME=/c/opt/java/openjdk/x86_64/jdk8u352-b08
```

## Apache Ant 1.10.12
Download from
```bash
https://ant.apache.org/bindownload.cgi
```

Install into your system
```bash

# Linux
/opt/apache-ant/apache-ant-1.10.12

# Windows
c:\opt\apache-ant\apache-ant-1.10.12
```
