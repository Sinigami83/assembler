global	_start

section	.bss

desk_f1	resb 1
desk_f2	resb 1

file_bf	resb 1024
file_ln	equ $-file_bf

section	.text
file1	db '/home/nodir/nasm_file/file/filepath1.txt', 0
file2	db '/home/nodir/nasm_file/file/filepath2.txt', 0

_start:	
		;open first file
		mov eax, 5
		mov ebx, file1
		mov ecx, 0		; open only for read
		int 0x80
		
		cmp eax, 0
		jle quit

		mov edi, eax

		;open second file
		mov eax, 5
		mov ebx, file2
		mov ecx, 241h	; created how clean	
		mov edx, 0666q
		int 0x80
				
		cmp eax, 0
		jle quit

		mov esi, eax

again:	
		mov eax, 3
		mov ebx, edi
		mov ecx, file_bf
		mov edx, file_ln
		int 0x80

		cmp eax, 1
		jle close_files
		
		mov edx, eax
		mov eax, 4
		mov ebx, esi
		mov ecx, file_bf
		int 0x80

		jmp again
		
close_files:
		mov eax, 6
		mov ebx, edi

		mov eax, 6
		mov ebx, esi

quit:	
		mov eax, 1
		mov ebx, 0
		int 0x80