%include "stud_io.inc"
global	function_write

section	.text
function_write:
		push ebp
		mov ebp, esp

		push eax
		push ebx
		push edx

		mov ebx, 10
		mov eax, [ebp + 8]

		push edi
		sub esp, 2
		mov edi, esp

.again:	test eax, eax
		jz .print
		xor edx, edx
		div ebx
		add edx, '0'
		push edx
		jmp short .again

.print:	pop eax
		test eax, eax
		jz .exit
		
		mov [edi], eax
		mov eax, 4
		mov ebx, 1
		mov ecx, edi
		mov edx, 1
		int 0x80
		;PRINT '!'
		jmp short .print

.exit:	add esp, 2
		pop edi
		
		pop edx
		pop ebx
		pop eax

		mov esp, ebp
		pop ebp
		ret
;----------------------------