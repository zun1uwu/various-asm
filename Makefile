all: loop hello

hello: hello.asm
	nasm -felf64 $<
	ld loop.o -o $@

loop: loop.asm
	nasm -felf64 $<
	ld loop.o -o $@

clean:
	rm -f loop loop.o hello hello.o
