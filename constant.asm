global _start

STDOUT equ 1
STDIN equ 0
SYS_EXIT equ 1
SYS_WRITE equ 4

section .data
	msg1 db 'Hello programmer!', 0xA, 0xD
	msg1Len equ $ - msg1
	
	msg2 db 'Welcome to the world of,', 0xA, 0xD
	msg2Len equ $ - msg2
	
	msg3 db 'Linux assembly programming! ', 0xA
	msg3Len equ $ - msg3
	

section .text
_start:
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg1
	mov edx, msg1Len
	int 0x80
	
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg2
	mov edx, msg2Len
	int 0x80

	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg3
	mov edx, msg3Len
	int 0x80

	mov eax, SYS_EXIT
	mov ebx, 0
	int 0x80
	

; EQU
; CONSTANT_NAME EQU expression

; %assign
; The %assign directive can be used to define numeric constants like the EQU directive. 
; This directive allows redefinition.
; %assign TOTAL 10

; %define
; The %define directive allows defining both numeric and string constants.
; %define PTR [EBP+4]
; The above code replaces PTR by [EBP+4], This directive also allows redefinition and it is case sensitive.
