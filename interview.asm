extern scanf
extern printf

global interview
segment .data
  welcomeprompt db "Hello %s.  I am Ms. Fenster.  The interview will begin now.", 10
                db "Wow!  %lf!  That's a lot of cash!  Who do you think you are,"
                db "Chris Sawyer? (y or n): ", 0
  stringformat db "%s", 0
  floatformat db "%lf", 0
  thank db "Thank you.  Please follow the exit signs to the front desk.", 10, 0
  collegemajorprompt db "Were you a computer science major? (y or n): ", 0
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

;TODO

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
