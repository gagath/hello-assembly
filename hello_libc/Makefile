
.PHONY: all
all: hello

rust.o: rust.rs
	rustc -Cpanic=abort -O -g --emit obj $^

%.o: %.s
	nasm -f elf64 -g -o $@ $^

hello: hello.o world.o rust.o
	#gcc -no-pie -g -o $@ $^
	gcc -fuse-ld=mold -no-pie -g -o $@ $^

.PHONY: clean
clean:
	rm -f *.o
	rm -f hello

.PHONY: test
test:
	./test.sh
