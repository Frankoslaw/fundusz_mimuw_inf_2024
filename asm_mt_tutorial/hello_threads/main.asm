# hello_threads/main.asm

.global _start
.intel_syntax
.section .text

# The external functions we need
.extern thread_run
.extern thread_wait
.extern print

_start:
    # Create a thread
    call _log
    lea %rax, [%rip + print]
    lea %rdi, [%rip + thread_msg]
    mov %rsi, OFFSET thread_msg_len
    call thread_run

    # Wait for the process (PID is in rax) then print
    call thread_wait
    call _pmsg

    # Create a thread
    call _log
    lea %rax, [%rip + print]
    lea %rdi, [%rip + thread2_msg]
    mov %rsi, OFFSET thread2_msg_len
    call thread_run

    # Print without waiting
    call _pmsg

    # Exit
    jmp _exit


_pmsg:
    # Print 'parent_msg'
    lea %rdi, [%rip + parent_msg]
    mov %rsi, OFFSET parent_msg_len
    call print
    ret

_log:
    # Print 'log_msg'
    lea %rdi, [%rip + log_msg]
    mov %rsi, OFFSET log_msg_len
    call print
    ret

_exit:
    # Exit safetly with status code 0
    mov %rax, 0x3c
    mov %rdi, 0x00
    syscall

.section .data
    log_msg:
        .ascii "\nCreating a thread..\n" # 20
        log_msg_len = . - log_msg
    thread_msg:
        .ascii "Hello from thread 1!\n" #19
        thread_msg_len = . - thread_msg
    thread2_msg:
        .ascii "Hello from thread 2!\n" #19
        thread2_msg_len = . - thread2_msg
    parent_msg:
        .ascii "Hello from parent!!\n" #20
        parent_msg_len = . - parent_msg
