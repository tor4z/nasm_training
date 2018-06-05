global _start

SYS_WRITE	equ 4
STDOUT		equ 1
SYS_EXIT	equ 1


section .data
	msg db 'The result is: '
	msgLen equ $ - msg
	newLine db 0xA
	newLineLen equ $ - newLine


section .bss
	res resb 1


section .text
_start:
	mov al, '3'
	sub al, '0'
	mov bl, '2'
	sub bl, '0'

	mul bl
	add al, '0'
	mov [res], al
	
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg
	mov edx, msgLen
	int 0x80

	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, res
	mov edx, 1
	int 0x80

	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, newLine
	mov edx, newLineLen
	int 0x80

	mov eax, SYS_EXIT
	mov ebx, 0
	int 0x80
	
; There are two instructions for multiplying binary data. The MUL (Multiply) instruction handles unsigned data and
; the IMUL (Integer Multiply) handles signed data. Both instructions affect the Carry and Overflow flag.

; The syntax for the MUL/IMUL instructions is as follows:
;       MUL/IMUL multiplier
; Multiplicand in both cases will be in an accumulator, depending upon the size of the multiplicand and the
; multiplier and the generated product is also stored in two registers depending upon the size of the operands.
; Following section explains MULL instructions with three different cases:


; The multiplicand is in the AL register, and the multiplier is a byte in the memory or in another register. The
; product is in AX. High order 8 bits of the product is stored in AH and the low order 8 bits are stored in AL
;        AL * [8 bit Source] = AH AL


; The multiplicand should be in the AX register, and the multiplier is a word in memory or another register. For
; example, for an instruction like MUL DX, you must store the multiplier in DX and the multiplicand in AX.
; The resultant product is a double word, which will need two registers. The High order (leftmost) portion gets
; stored in DX and the lower-order (rightmost) portion gets stored in AX.
;        AX * [16 bit Source] = DX AX


; When two doubleword values are multiplied, the multiplicand should be in EAX and the multiplier is a
; doubleword value stored in memory or in another register. The product generated is stored in the EDX:EAX
; registers, i.e., the high order 32 bits gets stored in the EDX register and the low order 32-bits are stored in
; the EAX register.
;        EAX * [32 bit Source] = EDX EAX

