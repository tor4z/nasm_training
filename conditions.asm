global _start

section .data
	msg db 'The largest number is: '	; Output msg
	msgLen equ $ - msg			; msg len
	newLine db 0xA				; new line

	num1 dd '47'
	num2 dd '22'
	num3 dd '31'


segment .bss
	result resb 2		; Reserve 2 byte memory for result


section .text
_start:
	mov ecx, [num1]		; Move the value of num1 to ecx
	cmp ecx, [num2]		; Compare num1 is ecx with num2
	jg check_third_num	; If num1 is ecx is great than num2, jump to check_third_num
	mov ecx, [num2]		; Else move num2 to ecx
check_third_num:
	cmp ecx, [num3]		; Compare the largest of num1 and num2 with num3
	jg exit			; If ecx is great than num3 then jump to exit
	mov ecx, [num3]		; Else move num3 to ecx

exit:
	mov [result], ecx	; Save the largest to result

	; Print output msg
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, msgLen
	int 0x80
	
	; Print result
	mov eax, 4
	mov ebx, 1
	mov ecx, result
	mov edx, 2
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

