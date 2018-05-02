global	function_read

section	.text
function_read:
		push ebp
		mov ebp, esp
		
		push ebx
		push ecx
		push edx
		push esi
		push edi

		xor esi, esi	
		sub esp, 4
		mov esi, esp

.enter:	mov eax, 3		; read
		mov ebx, 0		
		mov ecx, esi
		mov edx, 1
		int 0x80

		xor eax, eax
		mov al, [ecx]

		cmp eax, '0'
		jl .exit
		cmp eax, '9'
		jg .exit

.cont:	
		mov ebx, 10
		sub eax, '0'
		mov ecx, eax   	; getchar(cl)
		mov eax, edi
		xor edx, edx
		mul ebx
		add eax, ecx
		mov edi, eax 	; now: result = result * 10 + (cl - '0')

		jmp .enter		; goto again

.exit:	mov eax, edi

		add esp, 4
		pop edi
		pop esi
		pop edx
		pop ecx
		pop ebx
		
		mov esp, ebp
		pop ebp
		ret