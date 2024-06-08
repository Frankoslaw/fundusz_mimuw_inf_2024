main: main.o
	ld -o main main.o -dynamic-linker /lib64/ld-linux-x86-64.so.2 -L. -lc -lraylib -lm

main.o: main.asm
	fasm main.asm