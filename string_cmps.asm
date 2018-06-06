global _start

section .data
	s1 db 'Hello world!'	; First string to be compare
	s1Len equ $ - s1	; First string length
	s2 db 'Hello there!'	; Second string to be compare
	s2Len equ $ - s2	; Seconde string length
	
	msgEq db 'String are equal!', 0xA	; Equal msg
	msgEqLen equ $ - msgEq			; msg length
	msgNeq db 'String are not equal!', 0xA	; Not equal msg
	msgNeqLen equ $ - msgNeq		; msg length

section .text
_start:
	mov ecx, s2Len		; Set rep times, s1Len is equal to s2Len here

	mov eax, ds		; 
	mov es, eax		; Set the value of es equal to ds

	mov esi, s1		; Set compare string source pointer
	mov edi, s2		; Set compare string destination pointer
	
	cld			; Clean direction flag
	repe cmpsb		; Start to compare s1 and s2 byte by byte
	jecxz equal		; If ecx equal to zero, mean that s1 is equal to s2, jump to equal 
	jmp not_equal		; Else jump to no_equal

equal:
	; Print equal msg
	mov eax, 4
	mov ebx, 1
	mov ecx, msgEq
	mov edx, msgEqLen
	int 0x80
	jmp exit		; Jump to exit


not_equal:
	; Print not equal msg
	mov eax, 4
	mov ebx, 1
	mov ecx, msgNeq
	mov edx, msgNeqLen
	int 0x80
	jmp exit		; Jump to exit

exit:
	; Exit
	mov eax, 1
	mov ebx, 0
	int 0x80
	
; The CMPS instruction compares two strings. This instruction compares two data items of one byte, word or
; doubleword, pointed to by the DS:SI and ES:DI registers and sets the flags accordingly. You can also use the
; conditional jump instructions along with this instruction.

	
