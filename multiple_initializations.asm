global _start

section .data
	starts times 9 db '*'
	newLine db 0xa

section .text
_start:
	; Output starts
	mov eax, 4
	mov ebx, 1
	mov ecx, starts
	mov edx, 9
	int 0x80
	; '\n'
	mov eax, 4
	mov ebx, 1
	mov ecx, newLine
	mov edx, 1
	int 0x80
	; Exit
	mov eax, 1 ; exit sys call
	mov ebx, 0 ;exit code
	int 0x80
