global	_start
extern	function_read
extern 	function_write

section	.text
_start:	call function_read	; getnuber fist
		mov ebx, eax
	
		call function_read	; getnuber second
		mov ecx, eax

		push ecx
		push ebx
		call function_or 	; write or
		add esp, 8
		
		push ecx
		push ebx
		call function_and	; write and
		add esp, 8

		push ecx
		push ebx
		call function_xor	; write xor
		add esp, 8

		shl ebx, 1
		push ebx
		call function_write
		add esp, 4

		mov eax, 1
		mov ebx, 0
		int 0x80
;-----------------------------
function_or:
		push ebp
		mov ebp, esp

		push ebx
		push ecx
		push edx

		mov ebx, [ebp + 8]
		mov ecx, [ebp + 12]
		or ebx, ecx

		push ebx
		call function_write
		add esp, 4
		
		pop edx
		pop ecx
		pop ebx

		mov esp, ebp
		pop ebp
		ret		
;---------------------------------
function_and:
		push ebp
		mov ebp, esp

		push ebx
		push ecx
		push edx

		mov ebx, [ebp + 8]
		mov ecx, [ebp + 12]
		and ebx, ecx

		push ebx
		call function_write
		add esp, 4

		pop edx
		pop ecx
		pop ebx
		
		mov esp, ebp
		pop ebp
		ret		
;---------------------------------
function_xor:
		push ebp
		mov ebp, esp

		push ebx
		push edx

		mov ebx, [ebp + 8]
		mov ecx, [ebp + 12]
		xor ebx, ecx

		push ebx
		call function_write
		add esp, 4

		pop edx
		pop ebx

		mov esp, ebp
		pop ebp
		ret