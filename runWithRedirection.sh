#Assemble interview.asm using nasm assembler
nasm -f elf64 -l interview.lis -o interview.o interview.asm

#Compile Main.cpp using the gcc compiler
g++ -c -Wall -m64 -no-pie -o Main.o Main.cpp

#Link the object files using the g++ linker
g++ -m64 -no-pie -o employ.out Main.o interview.o

./employ.out < chris.txt
./employ.out < csmajor.txt
./employ.out < social.txt
