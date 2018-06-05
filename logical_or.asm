global _start

section .data
	newLine db 0xA	; new Line

section .bss
	res resb 1	; The result 1 byte


section .text
_start:
	mov al, 0x5		; getting 5 in the al
	mov bl, 0x3		; getting 3 in the bl
	or al, bl		; or al and bl registe, the result should be equal to 7
	add al, byte '0' 	; Convert number to char
	mov [res], al		; Save the value in al to res

	; Print result
	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 1
	int 0x80
	
	; Print '\n'
	mov eax, 4
	mov ebx, 1
	mov ecx, newLine
	mov edx, 1
	int 0x80
	jmp exit


exit:
	; exit
	mov eax, 1
	mov ebx, 0
	int 0x80
