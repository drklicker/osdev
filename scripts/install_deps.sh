#!/usr/bin/env bash

OS=
PACKAGE_UPDATE=
PACKAGE_INSTALL=
DEPS=

# Detect distro
if [ -x "$(command -v nala)" ]; then
    OS='debian'
    PACKAGE_UPDATE='nala update'
    PACKAGE_INSTALL='nala install'
    DEPS="build-essential bison flex libgmp3-dev libmpc-dev libmpfr-dev texinfo nasm mtools qemu-system-x86 python3-pip python3-scons"
elif [ -x "$(command -v apt-get)" ]; then
    OS='debian'
    PACKAGE_UPDATE='apt-get update'
    PACKAGE_INSTALL='apt-get install'
    DEPS="build-essential bison flex libgmp3-dev libmpc-dev libmpfr-dev texinfo nasm mtools qemu-system-x86 python3-pip python3-scons"
else
    echo "Unknown operating system!"; 
fi

read -p "Continue (y/n)?" choice
case "$choice" in 
  y|Y ) ;;
  * ) echo "Exiting..."
        exit 0
        ;;
esac

$PACKAGE_UPDATE
$PACKAGE_INSTALL ${DEPS[@]}
