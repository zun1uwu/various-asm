global _start

section .text
_start:
	mov rbx, 10

check:
	cmp rbx, 0
	jle exit

loop:
	mov rax, 0x01
	mov rdi, 2
	mov rsi, label
	mov rdx, label_len
	syscall
	dec rbx		
	jmp check

exit:
	mov rax, 0x3c
	mov rdi, 0
	syscall

section .data

label: db "what's up", 0xA
label_len equ $ - label
