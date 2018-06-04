global _start

section .data
	userMsg db 'Please enter a number: '
	userMsgLen equ $-userMsg
	dispMsg db 'You have entered: '
	dispMsgLen equ $-dispMsg


section .bss
; 3.2.2 RESB and Friends: Declaring Uninitialized Data

; RESB, RESW, RESD, RESQ, REST, RESO, RESY and RESZ are designed to be used
; in the BSS section of a module: they declare uninitialized storage space.
; Each takes a single operand, which is the number of bytes, words, doublewords
; or whatever to reserve. As stated in section 2.2.7, NASM does not support the
; MASM/TASM syntax of reserving uninitialized space by writing DW ? or similar
; things: this is what it does instead. The operand to a RESB-type pseudo-instruction
; is a critical expression: see section 3.8.

; For example:

; * buffer: resb 64 ; reserve 64 bytes
; * wordvar: resw 1 ; reserve a word
; * realarray resq 10 ; array of ten reals
; * ymmval: resy 1 ; one YMM register
; * zmmvals: resz 32 ; 32 ZMM registers
	num resb 5


section .text
_start:
	; User prompt
	mov eax, 4
	mov ebx, 1
	mov ecx, userMsg
	mov edx, userMsgLen
	int 0x80
	; Read and store the user input 
	mov eax, 3
	mov ebx, 2
	mov ecx, num
	mov edx, 5
	int 0x80
	; Output dispMsg
	mov eax, 4
	mov ebx, 1
	mov ecx, dispMsg
	mov edx, dispMsgLen
	int 0x80
	; Output the message user input
	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 5
	int 0x80
	; Exit
	mov eax, 1
	mov ebx, 0
	int 0x80

; nasm -g -f elf32 sys_call.asm
; ld -g -m elf_i386 sys_call.o

