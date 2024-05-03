extern printf

%macro str 2+
%1 db %2
%1_Length equ $ -%1
%endmacro

section .data

str Hello, "Hello world! %#04x", 10, 0

section .text

global myfunc
myfunc:
	push	rbp
	mov	rbp, rsp

	; call printf with temporary variable
	mov	rsi, rdi ; 1st arg into 2nd arg
	mov	rdi, Hello  ; put the address of the string in rdi
	xor	eax, eax ; reset LA
	call	printf

	;mov	rsp, rbp
	;pop	rbp
	leave
	ret
