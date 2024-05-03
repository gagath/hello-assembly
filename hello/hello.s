bits 64

section .data

SYS_WRITE equ 1
SYS_EXIT equ 60

STDOUT equ 1
STDERR equ 2

%macro str 2+
%1 db %2
%1_Length equ $ -%1
%endmacro

str Hello, "Hello world!", 10
str Welcome, "Welcome to Hello Systems 1.0", 10
str Newline, 10

section .note.GNU-stack

%macro write 1
	mov rax, SYS_WRITE
	mov rdi, STDOUT
	mov rsi, %1
	mov rdx, %1_Length
	syscall
%endmacro

%macro write 2
	mov rax, SYS_WRITE
	mov rdi, STDOUT
	mov rsi, %1
	mov rdx, %2
	syscall
%endmacro

%macro write 0
	write Newline
%endmacro

section .text
global _start

myfunc:
	push rbp
	mov rbp, rsp

	; stack content:
	; rbp    saved rbp
	; rbp+4  EIP (return address)

	; pass arguments
	mov rdx, rsi ; arg 2 to arg 3
	mov rsi, rdi ; arg 1 to arg 2
	mov rax, SYS_WRITE
	mov rdi, STDOUT
	syscall

	mov rsp, rbp
	pop rbp
	ret

_start:
	write Hello
	write

	mov rdi, Welcome
	mov rsi, Welcome_Length
	call myfunc

	mov rdi, Hello
	mov rsi, Hello_Length
	call myfunc

	mov rax, SYS_EXIT
	xor rdi, rdi
	syscall
