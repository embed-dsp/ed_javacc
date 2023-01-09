
# Copyright (c) 2023 embed-dsp, All Rights Reserved.
# Author: Gudmundur Bogason <gb@embed-dsp.com>


PACKAGE_NAME = javacc

PACKAGE_VERSION = 7.0.12

PACKAGE = $(PACKAGE_NAME)-$(PACKAGE_VERSION)

# ==============================================================================

# Determine system.
SYSTEM = unknown
ifeq ($(findstring Linux, $(shell uname -s)), Linux)
	SYSTEM = linux
endif
ifeq ($(findstring MINGW32, $(shell uname -s)), MINGW32)
	SYSTEM = mingw32
endif
ifeq ($(findstring MINGW64, $(shell uname -s)), MINGW64)
	SYSTEM = mingw64
endif
ifeq ($(findstring CYGWIN, $(shell uname -s)), CYGWIN)
	SYSTEM = cygwin
endif

# Determine machine.
MACHINE = $(shell uname -m)

# Architecture.
ARCH = $(SYSTEM)_$(MACHINE)

# ==============================================================================

# Configuration for linux system.
ifeq ($(SYSTEM), linux)
	# Apache Ant.
	# https://ant.apache.org
    ANT_DIR = /opt/apache-ant/apache-ant-1.10.12/bin
	
	INSTALL_DIR = /opt
endif

# Configuration for mingw32 system.
ifeq ($(SYSTEM), mingw32)
    ANT_DIR = /c/opt/apache-ant/apache-ant-1.10.12/bin

	INSTALL_DIR = /c/opt
endif

# Configuration for mingw64 system.
ifeq ($(SYSTEM), mingw64)
    ANT_DIR = /c/opt/apache-ant/apache-ant-1.10.12/bin

	INSTALL_DIR = /c/opt
endif

# Configuration for cygwin system.
ifeq ($(SYSTEM), cygwin)
    ANT_DIR = /cygdrive/c/opt/apache-ant/apache-ant-1.10.12/bin
	
	INSTALL_DIR = /cygdrive/c/opt
endif

# Installation directory.
PREFIX = $(INSTALL_DIR)/$(PACKAGE_NAME)/$(PACKAGE)

# ==============================================================================

all:
	@echo "JAVA_HOME = `printenv JAVA_HOME`"
	@echo "PREFIX = $(PREFIX)"
	@echo ""
	@echo "## Get Source Code"
	@echo "make download"
	@echo ""
	@echo "## Build"
	@echo "make prepare"
	@echo "make compile [J=...]"
	@echo ""
	@echo "## Install"
	@echo "[sudo] make install"
	@echo ""
	@echo "## Cleanup"
	@echo "make clean"
	@echo ""


.PHONY: download
download:
	-mkdir src
	cd src && wget -nc https://github.com/javacc/javacc/archive/refs/tags/$(PACKAGE).tar.gz


.PHONY: prepare
prepare:
	-mkdir build
	cd build && tar zxf ../src/$(PACKAGE).tar.gz
	cd build && mv javacc-$(PACKAGE) $(PACKAGE)


.PHONY: compile
compile:
	cd build/$(PACKAGE) && $(ANT_DIR)/ant jar


.PHONY: install
install:
	-mkdir -p $(PREFIX)
	-cp -a build/$(PACKAGE)/README.md $(PREFIX)
	-cp -a build/$(PACKAGE)/LICENSE $(PREFIX)

	-mkdir -p $(PREFIX)/docs
	-cp -a build/$(PACKAGE)/docs/* $(PREFIX)/docs

	-mkdir -p $(PREFIX)/examples
	-cp -a build/$(PACKAGE)/examples/* $(PREFIX)/examples

	-mkdir -p $(PREFIX)/grammars
	-cp -a build/$(PACKAGE)/grammars/* $(PREFIX)/grammars

	-mkdir -p $(PREFIX)/bin
	-cp -a build/$(PACKAGE)/scripts/* $(PREFIX)/bin

	-mkdir -p $(PREFIX)/target
	-cp -a build/$(PACKAGE)/target/javacc.jar $(PREFIX)/target


.PHONY: clean
clean:
	cd build/$(PACKAGE) && $(ANT_DIR)/ant clean
