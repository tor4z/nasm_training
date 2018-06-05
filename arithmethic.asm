global _start

SYS_EXIT	equ 1
SYS_READ	equ 3
SYS_WRITE	equ 4
STDOUT 		equ 1
STDIN		equ 0

section .data
	msg1 db 'Enter a digit: '
	msg1Len equ $ - msg1
	
	msg2 db 'Enter second digit: '
	msg2Len equ $ - msg2

	msg3 db 'The sum is: '
	msg3Len equ $ - msg3	

	msg4 db 0xa
	msg4Len equ $ - msg4

section .bss
	num1 resb 1
	num2 resb 1
	result resb 1


section .text
_start:
	; Input digit 1 msg
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg1
	mov edx, msg1Len
	int 0x80

	; Read digit 1
	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, num1
	mov edx, 2
	int 0x80

	; Input digi2 msg
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg2
	mov edx, msg2Len
	int 0x80
	
	; Read digit 2
	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, num2
	mov edx, 2
	int 0x80

	mov eax, [num1]		; move num1 to eax
	sub eax, '0'		; convert char to number
	mov ebx, [num2]		; move num2 to ebx
	sub ebx, '0'		; convert char to number

	add eax, ebx		; add ebx to eax
	add eax, '0'		; convert number to char
	mov [result], eax	; save the eax content to [result]

	; Result msg
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg3
	mov edx, msg3Len
	int 0x80

	; Print result
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, result
	mov edx, 1
	int 0x80

	; '\n'
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg4
	mov edx, msg4Len
	int 0x80
	
	; Exit	
	mov eax, SYS_EXIT
	mov ebx, 0
	int 0x80
	
