global	function_write

section	.text
function_write:
		push ebp
		mov ebp, esp

		push eax
		push ebx
		push ecx
		push edx

		mov ebx, 10
		mov eax, [ebp + 8]

		push edi
		sub esp, 2
		mov edi, esp
		PUSH word 0

.again:	test eax, eax
		jz .print
		xor edx, edx
		div ebx
		add edx, '0'
		push edx
		jmp short .again

.print:	xor eax, eax
		pop eax
		test eax, eax
		jz .exit

		mov [edi], al

		mov eax, 4
		mov ebx, 1
		mov ecx, edi
		mov edx, 1
		int 0x80
		jmp short .print

.exit:	add esp, 4
		
		pop edi

		pop edx
		pop ecx
		pop ebx
		pop eax

		mov esp, ebp
		pop ebp
		ret
;----------------------------