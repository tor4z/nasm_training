global _start

section .data
	achar db 0		; start char '\0'

section .text
_start:
	call display		; call procedures
	mov eax, 1		; sys exit
	mov ebx, 0		; exit code
	int 0x80		; call kernel

display:
	mov ecx, 177		; loop times
next:
	push ecx		; Store ecx to stack
	mov eax, 4		; sys write
	mov ebx, 1		; stdout
	mov ecx, achar		; print char
	mov edx, 1		; char length
	int 0x80		; call kernel

	pop ecx			; Restore ecx
	inc byte [achar]	; increase [achar], to print next char
	loop next		; loop it
	ret

