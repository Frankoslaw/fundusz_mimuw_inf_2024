# hello_world/main.asm


.intel_syntax
.global _start
.section .text

.extern print # Use our print function

_start:
    # Call the 'fork' syscall
    mov %rax, 0x39 # fork syscall on x64 Linux
    syscall
    cmp %rax, 0 # 'fork' will return 0 to the child process
    je _child

_parent:
    # Print 'Hello from parent!'
    lea %rdi, [%rip + msg1]
    mov %rsi, OFFSET msg1len
    call print
    jmp _exit

_child:
    # Print 'Hello from child!'
    lea %rdi, [%rip + msg2]
    mov %rsi, OFFSET msg2len
    call print

_exit:
    # Call the 'exit' syscall
    mov %rax, 0x3c # exit syscall on x64 Linux
    mov %rdi, 0x0 # Exit code
    syscall

.section .data
msg1:
    .ascii "Hello from parent!\n"
    msg1len = . - msg1
msg2:
    .ascii "Hello from child!\n"
    msg2len = . - msg2
