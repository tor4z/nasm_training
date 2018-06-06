global _start

section .bss
	res resb 1

section .text
_start:
	sub ah, ah	; Set ah to 00H
	mov al, '9'	; Getting '9' to al
	sub al, '3'	; SUB al with '3', the value in al is 06H
	aas		; ASCII Adjust After Subtract, the value in al is 06H
	mov [res], ax	; Move 06H to [res]

	; Print res
	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 1
	int 0x80

	; Exit	
	mov eax, 1
	mov ebx, 0
	int 0x80
