#Assemble interview.asm using nasm assembler
nasm -f elf64 -l interview.lis -g -F dwarf -o interview.o interview.asm

#Compile Main.cpp using the gcc compiler
g++ -c -Wall -m64 -no-pie -g -o Main.o Main.cpp

#Link the object files using the g++ linker
g++ -m64 -no-pie -o employ.out Main.o interview.o

gdb ./employ.out
