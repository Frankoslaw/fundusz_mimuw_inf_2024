format ELF64

section '.text' executable
public _start
extrn printf
extrn _exit
extrn InitWindow
extrn WindowShouldClose
extrn CloseWindow
extrn BeginDrawing
extrn EndDrawing
extrn ClearBackground
extrn DrawRectangle
extrn DrawRectangleV


_start:
    mov rdi, 800
    mov rsi, 600
    mov rdx, title
    call InitWindow

.again:
    call WindowShouldClose
    test rax, rax
    jnz .over

    call BeginDrawing

    mov rdi, 0xFF181818
    call ClearBackground

    movq xmm0, [position] 
    movq xmm1, [size]
    mov rdi, 0xFF0000FF
    call DrawRectangleV

    call EndDrawing

    jmp .again

.over:
    call CloseWindow
    mov rdi, 0
    call _exit

section '.data' writeable
position:
    dd 200.0
    dd 200.0
size:
    dd 200.0
    dd 200.0
title db "Test: Raylib from Fasm", 0
msg db "Hello, World", 10,0    

section '.note.GNU-stack'