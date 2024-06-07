# lib/util.asm


.intel_syntax
.section .text

# print function that takes (ptr, len)
# as arguments (rdi, rsi)
.global print
print:
    mov %rdx, %rsi # move the length to rdx
    mov %rsi, %rdi # move the pointer (rdi) to rsi
    mov %rax, 0x01 # write syscall on x64 Linux
    mov %rdi, 0x01 # STDOUT file descriptor
    syscall
    ret
