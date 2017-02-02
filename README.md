# FRC(++) Build tools

This repository contains the raw make files and scripts for building and deploying code for FRC C++ teams. Will automatically download and compile with the latest version of WPILib

Simply move these files into your repository and place your code in a directory named src/.

Status: Operational! (Report bugs as Issues)

## Start Here!

### Instructions

1. Install system dependencies

1. Download the zip package (located in releases)

1. Add code to a new folder called src

1. (Windows only) Add the binaries folder to your System PATH

## Dependencies

General:

  * CMake

  * FRC C++ Toolchain

Cygwin:

  * cmake

  * make

  * unzip

  * wget

  * openssh

Windows:

  * NMake (Visual Studio)

## User guide

### Linux/Cygwin

How to build code:

1. Make sure the code you want to compile is in src/ and the `Makefile` is in the directory above src/

1. Type `make` into the terminal

How to deploy code:

**FIRST TIME ONLY**

1. Type `ssh-keygen -t rsa` into the terminal

1. Enter file in which to save the key (/home/demo/.ssh/id_rsa): `roborio`

1. Enter passphrase (empty for no passphrase): [leave blank]

1. After the output, connect to the robot and type `ssh-copy-id -i roborio lvuser@roborio-[TEAM]-frc.local`. Be sure to replace [TEAM] with your number

1. Write your team number in the TEAM_NAME file. Make sure it is only one line and contains no extra spaces.

After this is done, simply type `make deploy` to deploy

### Windows

How to build code:

1. Make sure the code you want to compile is in src/ and the `Makefile` are in the directory above src/

1. Type `nmake /F Makefile.win` into cmd

How to deploy code:

1. type `nmake /F Makefile.win deploy`

### Commands

**Linux/Cygwin**

    make - build code
    make update - manually update WPILib
    make clean - clean output files
    make deploy - deploy to robot

**Windows**

    nmake /F Makefile.win - build code
    nmake /F Makefile.win update - manually update WPILib
    nmake /F Makefile.win clean - manually update WPILib
    nmake /F Makefile.win deploy - deploy to robot
