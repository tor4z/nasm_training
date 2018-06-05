global _start

section .bss
	res resb 1


section .data
	msg db	'The result is: '
	msgLen equ $ - msg
	newLine db 0xA


section .text
_start:
	sub ah, ah	; Set ah to 00H
	mov al, '9'	; Put '9' to al
	sub al, '3'	; '9' - '3' = 06H, value in al is number 06H
	aas		; ASCII Adjust
	or al, 30H	; 30H | 06H = 36H, convert 06H to ascii '6'
	mov [res], ax	; Store ax value to res 

	; Print msg
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, msgLen
	int 0x80
	
	; Print res
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

	; Exit
	mov eax, 1
	mov ebx, 0
	int 0x80
	
	
; AAA - ASCII Adjust After Addition
; AAS - ASCII Adjust After Subtraction
; AAM - ASCII Adjust After Multiplication
; AAD - ASCII Adjust Before Division
; These instructions do not take any operands and assumes the required operand to be in the AL register.

