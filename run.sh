# *****************************************************************************
# Program name: "KingOfAssembly".  This program simulates a job interview at
# Paramount Programmers, Inc.  The interviewee is prompted for their name and
# expected salary.  Special treatment is reserved for Chris Sawyer.  The
# interviewee is tested on basic circuit resistance.  They are then asked what
# their major was during college.  This determines their starting salary offer.
# Copyright (C) 2021 Sean Javiya.
#
# This file is part of the software KingOfAssembly                                                                   *
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
# *****************************************************************************
#
#
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
# Author information
#   Author name: Sean Javiya
#   Author email: seanjaviya@csu.fullerton.edu
# Program information
#   Program name: KingOfAssembly
#   Programming languages: One driver module in C++, one module in X86, one
#                          bash file, and three text files (of sample input).
#   Date program began: 2021-Apr-23
#   Date of last update: 2021-Mar-20
#   Date of reorganization of comments: 2021-May-20
#   Files in this program: Main.cpp, interview.asm, chris.txt, social.txt,
#                          csmajor.txt, run.sh
#   Status: Finished.
#   The program was tested extensively with no errors in (Tuffix) Ubuntu 20.04
# Purpose
#   This program assists with assembling, linking, compiling, and running.
#   This program is part of KingOfAssembly, which will simulate a job interview
#   eat a company.  This program will also be submit (for credit) for an
#   assignment conducted during my graduate studies program.
# This file
#    File name: run.sh
#    Language: shell script
#    Max page width: 132 columns  (this file was not optimized for printing)
#    execute without permissions: sh run.sh
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
#Assemble interview.asm using nasm assembler
nasm -f elf64 -l interview.lis -o interview.o interview.asm
#Compile Main.cpp using the gcc compiler
g++ -c -Wall -m64 -no-pie -o Main.o Main.cpp
#Link the object files using the g++ linker
g++ -m64 -no-pie -o employ.out Main.o interview.o
./employ.out
