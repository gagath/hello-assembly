extern printf
extern myfunc
extern my_rust_func

; Disable executable stack and make gcc happy
section .note.GNU-stack

section .text

; https://wiki.osdev.org/System_V_ABI
; rdi, rsi, rdx, rcx, r8, r9, stack

global main
main:
	; save stack
	push	rbp
	mov	rbp, rsp

	; reserve 4 bytes for temporary variable (32 bits)
	sub	rsp, 4
	mov	dword [rbp-4], 42

	; use scratch register for temporary counter
	mov	r15, 0x10

loop:
	mov	rdi, r15
	call	my_rust_func
	dec	r15
	jnz	loop

	; restore stack
	mov	rsp, rbp
	pop	rbp

	; return
	xor	eax, eax
	ret
