global	_start
extern	function_read
extern	function_write

section	.text
_start:		
		call function_read
		
		push eax
		call function_write
		add esp, 4

		mov eax, 1
		mov ebx, 0
		int 0x80