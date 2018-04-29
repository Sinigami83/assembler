%include "stud_io.inc"
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
		sub esp, 2
		mov esi, esp

.enter:	mov eax, 3		; read
		mov ebx, 0		
		mov ecx, esi
		mov edx, 1
		int 0x80

		cmp eax, 1
		jne .not_a_digit
		xor eax, eax
		mov eax, [ecx]

		cmp al, '0'
		jl .not_a_digit
		cmp al, '9'
		jg .not_a_digit

		jmp .cont

.not_a_digit:	
		xor eax, eax
		not eax
		jle .exit		; if eof goto ende

.cont:	mov ebx, 10
		sub eax, '0'
		mov ecx, eax   	; getchar(cl)
		mov eax, edi
		xor edx, edx
		mul ebx
		add eax, ecx
		mov edi, eax 	; now: result = result * 10 + (cl - '0')
		jmp .enter		; goto again

.exit:	mov eax, edi
		add esp, 2
		pop edi
		pop esi
		pop edx
		pop ecx
		pop ebx
		
		mov esp, ebp
		pop ebp
		ret