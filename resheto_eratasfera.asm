global	_start
extern	function_write

section	.bss
arr_num	resb n

section	.text
n		equ 1024

ten		db 10

_start:
		mov dl, 1
		mov ecx, n
		xor ebx, ebx

agn_i:	mov byte [arr_num + ebx], dl ;enter true in array
		inc ebx
		loop agn_i

		mov ecx, 1
agn_r:	inc ecx
		cmp ecx, n
		jge agn_u
		mov eax, ecx
		mov ebx, 1
agn_b:	inc ebx
		xor edx, edx
		mul ebx
		sub eax, 1
		cmp eax, n
		jge agn_r
		mov byte [arr_num + eax], 0
		mov eax, ecx
		jmp agn_b

agn_u:	xor ebx, ebx
		mov ecx, n
		xor edx, edx
		mov byte[arr_num + ebx], 0

again:	mov al, byte [arr_num + ebx] ; writeln array
		cmp al, 0
		jz ex_ag
		pusha
		mov esi, ebx
		add esi, 1
		push esi
		call function_write
		add esp, 4
		popa
ex_ag:	inc ebx
		loop again		

		mov eax, 1
		mov ebx, 0
		int 0x80