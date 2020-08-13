%: %.o
	ld -o $@ $<
%.o: %.asm
	nasm -felf64 $<
.PHONY: clean
clean:
	rm -f *.o *.c~ *.h~
