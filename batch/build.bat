@echo off

SET LIB="wpilib\"
SET CTRE="CTRE\include"

call batch\.compiler-download.bat

REM Exit if FRC C++ Toolchain not found
if exist Error.txt (
    ECHO batch\build.bat: Compiler not found
    ECHO batch\build.bat: Exiting...
    rm Error.txt
    EXIT /b 1
)

ECHO build.bat: Checking internet...

Ping www.google.com -n 2 -w 1000
if errorlevel 1 (
    ECHO build.bat: Offline
) else (
    ECHO build.bat: Online
    if not exist CTRE call batch\.get-ctre.bat
    if exist CTRE.txt EXIT /b 1
    if not exist wpilib call batch\.wpilib-download.bat
    if exist wpilib.txt EXIT /b 1
    REM exit early if unable to get required materials
)

CD .build

rm -rf CMakeFiles CMakeCache.txt cmake_install.cmake Makefile

ECHO build.bat: Generating Makefiles...
cmake .. -G "NMake Makefiles" -DCMAKE_TOOLCHAIN_FILE=arm.cmake -DCMAKE_TOOLCHAIN_FILE=robot.cmake

nmake

ECHO build.bat: Deleting CMakeFiles...
rm -rf CMakeFiles/

ECHO build.sh: Re-naming outfile...
if exist FRCUserProgram rm FRCUserProgram
move FRC FRCUserProgram

if exist FRCUserProgram (
    ECHO Build successfully!
    CD ..
    PAUSE
    EXIT
) else (
    ECHO Build failed!
    CD ..
    PAUSE
    EXIT /b 1
)
