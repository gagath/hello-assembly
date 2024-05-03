
.PHONY: all
all: hello

# x86 ELF

hello.o: hello.s
	nasm -f elf32 -g $^ -o $@

hello: hello.o
	ld -m elf_i386 -g -o $@ $^

.PHONY: clean
clean:
	rm -f *.o
	rm -f hello
