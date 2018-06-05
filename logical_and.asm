global _start

section .data
	msgEven db 'Event number!', 0xA
	msgEvenLen equ $ - msgEven
	msgOdd db 'Odd number!', 0xA
	msgOddLen equ $ - msgOdd


section .text
_start:
	mov ax, 0x8	; move 0x8 to ax
	and ax, 0x1	; and ax with 0x1
	jz even		; If Zero Flag is set jump to even

	; Print odd msg
	mov eax, 4
	mov ebx, 1
	mov ecx, msgOdd
	mov edx, msgOddLen
	int 0x80
	jmp exit

even:	
	; Print even msg
	mov eax, 4
	mov ebx, 1
	mov ecx, msgEven
	mov edx, msgEvenLen
	int 0x80
	jmp exit

exit:
	; exit
	mov eax, 1
	mov ebx, 0
	int 0x80


