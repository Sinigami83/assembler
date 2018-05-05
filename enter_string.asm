%include "stud_io.inc"
global 	_start

section	.text
str_y	db 'Yes', 0
str_n	db 'No', 0
arr1	db 'This is long string!'
arr_ln	equ $-arr1

arr2	db 'a'
next_st	db 10, 0

section	.text
_start:	
		mov edi, arr1
		mov ecx, arr_ln
		mov al, 'a'
		cld
		repnz scasb
		test ecx, ecx
		jz writ_n

		push dword str_y
		call function_write
		add esp, 4
		jmp quit

writ_n:	
		push dword str_n
		call function_write
		add esp, 4
		jmp quit

quit:	
		push dword next_st
		call function_write
		add esp, 4
		
		mov eax, 1
		mov ebx, 0
		int 0x80
;-------------------
function_str_len:
		push ebp
		mov ebp, esp

		xor eax, eax
		mov ecx, [ebp + 8]
		
.again:	
		cmp byte [ecx + eax], 0
		jz .quit
		inc eax
		jmp .again

.quit:	
		mov esp, ebp	
		pop ebp
		ret

;--------------------
function_write:
		push ebp
		mov ebp, esp

		mov ebx, [ebp + 8]
		
		push ebx
		call function_str_len
		add esp, 4

		mov edx, eax
		mov ecx, ebx
		mov ebx, 1
		mov eax, 4
		int 0x80

		mov esp, ebp	
		pop ebp
		ret
;-------------------