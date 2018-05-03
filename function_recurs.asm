global	_start
extern	function_read
extern 	function_write

section	.text
_start:	call function_read

		push eax
		call function_rec
		add esp, 4

		push eax
		call function_write
		add esp, 4

		mov eax, 1
		mov ebx, 0
		int 0x80

;----------------------
function_rec:
		push ebp
		mov ebp, esp

		mov eax, [ebp + 8]

		test eax, eax
		jz .rec_z
	
		push eax
		sub	eax, 1
		push eax
		call function_rec
		add esp, 4
		pop ebx
		mul ebx 
		jmp .exit

.rec_z: mov eax, 1
		jmp .exit

.exit:	mov esp, ebp
		pop ebp
		ret
;----------------------