;******************************************************************************;
; Program name: "KingOfAssembly".  This program simulates a job interview at
; Paramount Programmers, Inc.  The interviewee is prompted for their name and
; expected salary.  Special treatment is reserved for Chris Sawyer.  The
; interviewee is tested on basic circuit resistance.  They are then asked what
; their major was during college.  This determines their starting salary offer.
; Copyright (C) 2021 Sean Javiya.
;
; This file is part of the software KingOfAssembly
; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.
;
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
;
; You should have received a copy of the GNU General Public License
; along with this program.  If not, see <https://www.gnu.org/licenses/>.
; *****************************************************************************
;
;
;------------------------------------------------------------------------------;
;------------------------------------------------------------------------------;
;Author information
;  Author name: Sean Javiya
;  Author email: seanjaviya@csu.fullerton.edu
;Program information
;   Program name: KingOfAssembly
;   Programming languages: One driver module in C++, one module in X86, one
;                          bash file, and three text files (of sample input).
;   Date program began: 2021-Apr-23
;   Date of last update: 2021-Mar-20
;   Date of reorganization of comments: 2021-May-20
;   Files in this program: Main.cpp, interview.asm, chris.txt, social.txt,
;                          csmajor.txt, run.sh
;   Status: Finished.
;  The program was tested extensively with no errors in (Tuffix) Ubuntu 20.04
;Purpose
;  This program will simulate an interviewer asking questions to a potential
;  job candidate.  The user is asked if they are Chris Sawyer through the
;  standard input device.  If they are not Chris Sawyer, the interviewee is
;  quized on some knowledge of electrical circuit resistances.  Then, the user
;  is asked about their major in college.  This will determine their starting
;  salary offer, which is returned to the caller.
;  This program will also be submit (for credit) for an assignment conducted
;  during my graduate studies program.
;This file
;   File name: interview.asm
;   Language: X86 with Intel syntax
;   Max page width: 132 columns  (this file was not optimized for printing)
;   Assemble:
;     nasm -f elf64 -l interview.lis -o interview.o interview.asm
;   Link:
;     g++ -m64 -no-pie -o employ.out Main.o interview.o
;------------------------------------------------------------------------------;
;------------------------------------------------------------------------------;
extern scanf
extern printf
global interview
segment .data
  welcomeprompt db "Hello %s.  I am Ms. Fenster.  The interview will begin now.", 10
                db "Wow!  %.2lf!  That's a lot of cash!  Who do you think you are,"
                db "Chris Sawyer? (y or n): ", 0
  stringformat db "%s", 0
  floatformat db "%lf", 0
  thank db "Thank you.  Please follow the exit signs to the front desk.", 10, 0
  collegemajorprompt db "Were you a computer science major? (y or n): ", 0
  circuit1prompt db "Alright, now we will work on your electricity.", 10
                 db "Please enter the resistance of circuit #1 in ohms: ", 0
  circuit2prompt db "Please enter the resistance of circuit #2 in ohms: ", 0
  printresistance db "The total resistance is %8.6lf ohms.", 10, 0
segment .bss
segment .text
interview:
;preserve the registers onto the stack
push rbp
mov  rbp,rsp
push rdi
push rsi
push rdx
push rcx
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
push rbx
pushf
;get on boundary
push qword 0
;preserve parameters
mov r15, rdi
movsd xmm15, xmm0
;start by prompt
push qword 0
mov rax, 1
mov rdi, welcomeprompt
mov rsi, r15
movsd xmm0, xmm15
call printf
pop rax
;read value
push qword 0
mov rax, 0
mov rdi, stringformat
mov rsi, rsp
call scanf
mov rax, [rsp]
pop rdi
;check the value just read
cdqe
cmp rax, 'y'
je ChrisSawyerIsUsingMyProgramOMG
;else its some random schmuck who isn't that cool so we do some electric stuff
;ask for circuit 1
push qword 0
mov rax, 0
mov rdi, circuit1prompt
call printf
pop rax
;read value
push qword 0
mov rax, 0
mov rdi, floatformat
mov rsi, rsp
call scanf
movsd xmm15, [rsp]  ; value R1 xmm15
pop rax
;ask for circuit 2
push qword 0
mov rax, 0
mov rdi, circuit2prompt
call printf
pop rax
;read value
push qword 0
mov rax, 0
mov rdi, floatformat
mov rsi, rsp
call scanf
movsd xmm14, [rsp]  ; value R2 xmm14
pop rax
;do the calculation
mov rax, 1
cvtsi2sd xmm13, rax ; holds 1 xmm13
divsd xmm13, xmm14  ; holds 1/R2 xmm13
cvtsi2sd xmm14, rax ; holds 1 xmm14
divsd xmm14, xmm15  ; holds 1/R1 xmm14
cvtsi2sd xmm15, rax ; holds 1 xmm15
addsd xmm14, xmm13  ; holds 1/R1 + 1/R2 xmm14
divsd xmm15, xmm14  ; Holds 1/(1/R1 + 1/R2) = R xmm15
push qword 0
mov rax, 1
mov rdi, printresistance
movsd xmm0, xmm15
call printf
pop rax
;and then we ask if comp sci major
;start by prompt
push qword 0
mov rax, 0
mov rdi, collegemajorprompt
call printf
pop rax
;read value
push qword 0
mov rax, 0
mov rdi, stringformat
mov rsi, rsp
call scanf
mov rax, [rsp]
pop rdi
;check the value just read
cdqe
cmp rax, 'y'
je ComputerScientistDetected
;else they are a social major schmuck
;return 1200.12
push qword 0
mov rax, 0
mov rdi, thank
call printf
pop rax
;print Thank
mov rax, 0x4092C07AE147AE14
movq xmm0, rax
jmp restore_registers
;prepare for return of $1200.12
ComputerScientistDetected:
;return 88000.88
push qword 0
mov rax, 0
mov rdi, thank
call printf
pop rax
;print Thank
mov rax, 0x40F57C0E147AE148
movq xmm0, rax
jmp restore_registers
;prepare for return of $88000.88
ChrisSawyerIsUsingMyProgramOMG:
;wow a wizard took the time to use MY program!
push qword 0
mov rax, 0
mov rdi, thank
call printf
pop rax
;print Thank
mov rax, 1000000
cvtsi2sd xmm0, rax
;prepare for return of $1 million
restore_registers:
pop rax
;restore the registers from the stack
popf
pop rbx
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rcx
pop rdx
pop rsi
pop rdi
pop rbp
;------------------------------------------------------------------------------;
;return statement
ret
