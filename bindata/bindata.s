[bits 32]

section .data

Foo db "BBBB"

section .text

mov eax, Foo
lea eax, [eax * 2 + 2]
