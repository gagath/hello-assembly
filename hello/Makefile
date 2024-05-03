
.PHONY: all
all: hello

hello.o: hello.s
	nasm -f elf64 -g $^ -o $@

hello: hello.o
	ld -nostdlib -no-pie -g -o $@ $^

.PHONY: clean
clean:
	rm -f *.o
	rm -f hello
