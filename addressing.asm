global _start

section .data
	name db 'Zara Ali', 0xa
	nameLen equ $-name

section .text
_start:
	; Output name
	mov eax, 4
	mov ebx, 1
	mov ecx, name
	mov edx, nameLen
	int 0x80
	; Change the name value
	mov [name], dword 'Nuha'
	; Output the new name
	mov eax, 4
	mov ebx, 1
	mov ecx, name
	mov edx, nameLen
	int 0x80
	; Exit
	mov eax, 1
	mov ebx, 0
	int 0x80

; Type Specifier Bytes addressed
; BYTE             1
; WORD             2
; DWORD            4
; QWORD            8
; TBYTE            10
