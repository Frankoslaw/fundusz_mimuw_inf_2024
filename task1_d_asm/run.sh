as -o test.o test.asm
as -o lib/util.o lib/util.asm
as -o lib/thread.o lib/thread.asm
ld -o test test.o lib/util.o  lib/thread.o -nostdlib
./test