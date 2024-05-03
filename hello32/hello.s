bits 32
global _start

section .note.GNU-stack

section .data

Hello db "Hello world!", 10
Hello_Length equ $ -Hello
World db "World!", 10
World_Length equ $ -World

section .text

; testfunc(str, strlen)
testfunc:
	push ebp
	mov ebp, esp

	; stack content:
	; ebp    saved ebp
	; ebp+4  EIP (return address)
	; ebp+8  first argument
	; ebp+12 second argument

	mov eax, 4 ; sys_write
	mov ebx, 1 ; stdout
	mov ecx, [ebp+8] ; str
	mov edx, [ebp+12] ; strlen
	int 0x80

	mov esp, ebp
	pop ebp
	ret

_start:
	push ebp
	mov ebp, esp

	push Hello_Length
	push Hello
	call testfunc

	push World_Length
	push World
	call testfunc

	mov eax, 1 ; exit
	xor ebx, ebx
	int 0x80
