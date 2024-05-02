
.PHONY: all
all: hello hello64

# x86 ELF

hello.o: hello.s
	nasm -f elf32 $^ -o $@

hello: hello.o
	ld -m elf_i386 -o $@ $^

# x86_64 ELF

hello64.o: hello64.s
	nasm -f elf64 $^ -o $@

hello64: hello64.o
	ld -o $@ $^

.PHONY: clean
clean:
	rm -f *.o
	rm -f hello64 hello
