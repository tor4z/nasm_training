global _start

section .data
	msg db 'The Sum is: '
	msgLen equ $ - msg
	num1 db '12345'		; ASCII number1
	num2 db '23456'		; ASCII number2
	sum  db '     '		; To store result with 5 space


section .text
_start:
	mov ecx, 5		; Loop 5 times
	mov esi, 4		; Pointing to the right most digit, shift 4
	clc			; Clean carry flag
add_loop:
	mov al, [num1 + esi]	; Move the right most number1(Not calculate) to al
	adc al, [num2 + esi]	; Add the right most nmuber2(Not calculate) with al, and with carry
	aaa			; ASCII Adjust After Add
	pushf			; Push flag to stack to protect flag
	or al, 30H		; Convert number to ASCII
	popf			; Restore flag
	mov [sum + esi], al	; Store al to sum in the associate position
	dec esi			; Calculate next position in the next loop
	loop add_loop		; Loop 5 times

	; Print msg
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, msgLen
	int 0x80
	
	; Print sum
	mov eax, 4
	mov ebx, 1
	mov ecx, sum
	mov edx, 5
	int 0x80

	; Exit
	mov eax, 1
	mov ebx, 0
	int 0x80
