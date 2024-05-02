bits 64

section .data

%macro str 2+
%1 db %2
%1_Length equ $ -%1
%endmacro

str Hello, "Hello world!", 10
str Welcome, "Welcome to Hello Systems 1.0", 10
str Newline, 10

section .bss

buffer: resb 64

%macro write 1
	mov rax, 1 ; sys_write
	mov rdi, 1 ; stdout
	mov rsi, %1
	mov rdx, %1_Length
	syscall
%endmacro

%macro write 2
	mov rax, 1 ; sys_write
	mov rdi, 1 ; stdout
	mov rsi, %1
	mov rdx, %2
	syscall
%endmacro

%macro write 0
	write Newline
%endmacro

section .text
global _start

_start:
	write Hello
	write
	write Welcome

	mov rax, 60 ; exit
	xor rdi, rdi
	syscall
