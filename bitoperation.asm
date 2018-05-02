global	_start
extern	function_read
extern 	function_write



section	.text
_start:	call function_read	; getnuber fist
		mov ebx, eax

		call function_read	; getnuber second
		mov ecx, eax

		push ebx			
		call function_shl	; write sl
		add esp, 4
	
		push ebx
		push ecx
		call function_or 	; write or
		add esp, 8
		
		push ebx
		push ecx
		call function_and	; write and
		add esp, 8

		push ebx
		push ecx
		call function_xor	; write xor
		add esp, 8

		mov eax, 1
		mov ebx, 0
		int 0x80

;---------------------------------
function_shl:
		push ebp
		mov ebp, esp

		pusha

		mov eax, [ebp + 8]
		shl eax, 1

		push eax
		call function_write
		add esp, 4

		popa

		mov esp, ebp
		pop ebp
		ret		
;---------------------------------
function_or:
		push ebp
		mov ebp, esp

		pusha
		
		mov eax, [ebp + 8]
		mov ebx, [ebp + 12]
		or eax, ebx

		push eax
		call function_write
		add esp, 4
		
		popa

		mov esp, ebp
		pop ebp
		ret		
;---------------------------------
function_and:
		push ebp
		mov ebp, esp

		pusha
		
		mov eax, [ebp + 8]
		mov ebx, [ebp + 12]
		and eax, ebx

		push eax
		call function_write
		add esp, 4

		popa

		mov esp, ebp
		pop ebp
		ret		
;---------------------------------
function_xor:
		push ebp
		mov ebp, esp

		pusha

		mov eax, [ebp + 8]
		mov ebx, [ebp + 12]
		xor eax, ebx

		push eax
		call function_write
		add esp, 4

		pusha

		mov esp, ebp
		pop ebp
		ret