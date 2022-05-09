SYS_WRITE equ 1
STDOUT    equ 1
STDIN     equ 0
SYS_READ  equ 0
SYS_EXIT  equ 60

global _start

section .text
  _start:
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, msg1
    mov rdx, len1
    syscall

    mov rax, SYS_READ
    mov rdi, STDIN
    mov rsi, num1
    mov rdx, num1_len
    syscall

    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, msg2
    mov rdx, len2
    syscall

    mov rax, SYS_READ
    mov rdi, STDIN
    mov rsi, num2
    mov rdx, num2_len
    syscall

    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, msg3
    mov rdx, len3
    syscall

    mov rax, [num1]
    sub rax, '0'
    mov rbx, [num2]
    sub rbx, '0'

    add rax, rbx
    add rax, '0'
    mov [res], rax

    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, res
    mov rdx, res_len
    syscall

    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, newline
    mov rdx, newline_len
    syscall

    mov rax, SYS_EXIT
    xor rdi, rdi 
    syscall


section .data
  msg1 db "Enter a first digit: "
  len1 equ $ - msg1

  msg2 db "Enter a second digit: "
  len2 equ $ - msg2
  
  msg3 db "The sum is >>> "
  len3 equ $ - msg3
  
  newline db 0x0A
  newline_len equ $ - newline

section .bss
  num1 resb 2
  num1_len equ $ - num1
  
  num2 resb 2
  num2_len equ $ - num2
  
  res  resb 2
  res_len equ $ - res
