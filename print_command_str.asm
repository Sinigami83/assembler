global	_start

section	.text

lnstr	db 10, 0 		; syble next string

_start:	mov edx, [esp] 	
		mov esi, esp
		add esi, 4
		
again: 	push dword [esi]
		call function_print_str
		add esp, 4
		
		push dword lnstr
		call function_print_str
		add esp, 4

		add esi, 4
		dec edx
		jnz again

exit:	mov eax, 1
		mov ebx, 0
		int 0x80

;-------------------
function_strln:
		push ebp
		mov ebp, esp

		xor eax, eax
		mov ecx, [ebp + 8]

.again:	cmp byte [ecx + eax], 0
		jz .quit
		inc eax
		jmp .again

.quit:	mov esp, ebp
		pop ebp
		ret
;-------------------

function_print_str:
		push ebp
		mov ebp, esp

		push edx
		mov ebx, [ebp + 8]
		
		push ebx
		call function_strln
		add esp, 4

		mov edx, eax
		mov ecx, ebx
		mov ebx, 1
		mov eax, 4
		int 0x80

		pop edx
		mov esp, ebp
		pop ebp
		ret
;------------------