all:	
	nasm -f elf function_read.asm
	nasm -f elf function_write.asm
	nasm -f elf mine.asm
	ld mine.o function_read.o function_write.o -o mine
	
