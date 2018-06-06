global _start


section .data
	msg db 'Hello world!', 0	;string end with '\0'
	msgLen equ $ - msg


section .bss
	res resb 20


section .text
_start:
	mov ecx, msgLen	; rep times
	mov esi, msg	; movs pointing to source DS:ESI 
	mov edi, res	; movs pointing to destination ES:EDI
	cld		; Clean direction flag
	rep movsb	; rep mov string from DS:ESI to ES:EDI one byte by noe byte

	; Print result	
	mov eax, 4
	mov ebx, 1
	mov ecx, res,
	mov edx, 20
	int 0x80

	; Exit
	mov eax, 1
	mov ebx, 0
	int 0x80

