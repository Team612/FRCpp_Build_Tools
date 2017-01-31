# FRC(++) Build tools

This repository contains the raw make files and scripts for building and deploying code for FRC C++ teams. Will automatically download and compile with the latest version of WPILib

Simply move these files into your repository and place your code in a directory named src/.

Status: Operational! (Report bugs as Issues)

## Start Here!

### Instructions

1. Download source code and add files to your repository

1. Write code in src/

## Dependencies

General:

  * CMake

  * FRC Toolchain

Cygwin:

  * cmake

  * make

  * unzip

  * wget

  * openssh

Windows:

  * NMake (Visual Studio)

  * unzip.exe [link](http://stahlworks.com/dev/unzip.exe) in PATH

  * wget.exe or wget64.exe (depending on your system)  [link](https://eternallybored.org/misc/wget/) in PATH

  * WinSCP [link](https://winscp.net/eng/download.php)

## User guide

### Linux/Cygwin

How to build code:

1. Make sure the code you want to compile is in src/ and the `Makefile` are in the directory above src/

1. Type `make` into the terminal

How to deploy code:

**FIRST TIME ONLY**

1. Type `ssh-keygen -t rsa` into the terminal

1. Enter file in which to save the key (/home/demo/.ssh/id_rsa): `roborio`

1. Enter passphrase (empty for no passphrase): [leave blank]

1. After the output, connect to the robot and type `ssh-copy-id -i roborio lvuser@roborio-[TEAM]-frc.local`. Be sure to replace [TEAM] with your number

1. Write your team number in the TEAM_NAME file. Make sure it is only one line and contains no extra spaces.

After this is done, simply type `make deploy`to deploy

### Windows

How to build code:

1. Make sure the code you want to compile is in src/ and the `Makefile` are in the directory above src/

1. Type `nmake /F Makefile.win` into cmd

How to deploy code:

1. Login to your roborio with WinSCP and copy .build\FRCUserProgram into the home directory

1. You may need to restart the robot code from the driver station

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
