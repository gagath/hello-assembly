bits 32
global _start

section .note.GNU-stack

section .data

Hello db "Hello world!", 10

section .text

_start:
	push ebp
	mov ebp, esp

	mov eax, 4 ; sys_write
	mov ebx, 1 ; stdout
	mov ecx, Hello
	mov edx, 13
	int 0x80

	mov eax, 1 ; exit
	xor ebx, ebx
	int 0x80
