# hello_threads/main.asm

.global _start
.intel_syntax
.section .text

# The external functions we need
.extern thread_run
.extern thread_wait
.extern print

_start:
    # Create threads
    lea %rax, [%rip + thread_code]
    call thread_run
    push %rax

    lea %rax, [%rip + thread_code]
    call thread_run
    push %rax

    # Wait for the process (PID is in rax) then print
    pop %rax
    call thread_wait
    pop %rax
    call thread_wait

    movw [p], 0x03
    movw %eax, [p]
    inc %eax

_before_exit:
    # Exit
    jmp _exit

.global thread_code
thread_code:
    mov %r8, 100
loop_begin:
    # read and wrrite q here

    dec %r8
    jnz loop_begin

    ret

_exit:
    # Exit safetly with status code 0
    mov %rax, 0x3c
    mov %rdi, 0x00
    syscall

.section .bss:
    .balign 8 
    p:
        .skip 4
    q: 
        .skip 4
