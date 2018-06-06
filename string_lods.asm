global _start

section .data
	pwd db 'password', 0	; String end with '\0'
	pwdLen equ $ - pwd	; Length of pwd

section .bss
	res resb 10		; Reserve 10 byte to store result


section .text
_start:
	mov ecx, pwdLen		; msg length
	dec ecx			; ecx - 1, to skip '\0' in the end of msg
	mov edi, res		; Destination ES:EDI
	mov esi, pwd		; Source DS:ESI

loop_shift:
	lodsb			; load 1 byte string from DS:ESI to al
	add al, 02		; shift char
	stosb			; Store 1 byte from al to DS:ESI
	loop loop_shift		; Loop pwdLen - 1 times
	
	rep movsb		; mov string from DS:ESI to ES:EDI one byte by one byte
	
	; Print result
	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 20
	int 0x80

	; Exit
	mov eax, 1
	mov ebx, 0
	int 0x80


; LODS - This instruction loads from memory. If the operand is of one byte, it is loaded into
; the AL register, if the operand is one word, it is loaded into the AX register and a doubleword
; is loaded into the EAX register.

