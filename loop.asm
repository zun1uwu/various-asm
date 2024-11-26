global _start

section .text
_start:
	mov rbx, 10	; Count down from 10

check:
	cmp rbx, 0	; Checks if the condition is still valid
	jle exit	; Go to exit if rbx is 0

loop:
	mov rax, 0x01		; Select write syscall
	mov rdi, 2		; Write to stdout
	mov rsi, label		; Message parameter
	mov rdx, label_len	; Length of our label
	syscall			; Issue syscall
	dec rbx			; Decrease rbx (our index)
	jmp check		; Go to the next loop iteration

exit:
	mov rax, 0x3c		; Exit syscall
	mov rdi, 0		; Exit-code 0
	syscall			; Issue syscall

section .data

label: db "what's up", 0xA	; Our label
label_len equ $ - label		; Current location minus location of "label" equals length of the label
