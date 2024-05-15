global _start

; this just stores compile-time 'variables'
; e.g. the strings we want to print
section .data

				; append a newline '\n'
message: db "Hello, world!",	0xA
message_len equ $ - message

; this marks where our actual logic starts
section .text

_start:
	; main function

	; print the message
	
	; rax		rdi		rsi		rdx
	; write		(int fd,	char *s,	size_t count)
	mov rax, 0x01
	mov rdi, 0x01
	mov rsi, message
	mov rdx, message_len
	syscall

	; finally exit
	; rax		rdi
	; exit		(int code)
	mov rax, 0x3c
	mov rdi, 0
	syscall
