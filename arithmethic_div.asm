global _start

section .data
	msg db 'The result is: '
	msgLen equ $ - msg


section .bss
	res resb 1
	

section .text
_start:
	mov ax, '8'	; Put char in 16-bit ax 
	sub ax, '0'	; Convert char to number
	mov bl, '4'	; Put char in 8-bit bl
	sub bl, '0'	; convert char to number

	div bl		; ax/bl
	add al, '0'	; Convert number to char
	; add ax, '0'	; Convert number to char
	mov [res], al	; move the number in al(Quotient) to [res]
	; mov [res], ax	; move the number in ax(Quotient) to [res]
	
	; Print msg 
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, msgLen
	int 0x80
	
	; Print result
	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 1
	int 0x80

	; Exit
	mov eax, 1
	mov ebx, 0
	int 0x80

; The dividend is assumed to be in the AX register (16 bits). After division, the quotient goes to the AL register
; and the remainder goes to the AH register.
;
;  16-bit divident
;       AX           Quotient   Remainder
; ---------------- =  [AL]  And  [AH]
;   8-bit Divisor



; The dividend is assumed to be 32 bits long and in the DX:AX registers. The high order 16 bits are in DX and the
; low order 16 bits are in AX. After division, the 16 bit quotient goes to the AX register and the 16 bit remainder
; goes to the DX register.
;
;  32-bit divident
;       EAX          Quotient   Remainder
; ---------------- =   [AX]  And  [DX]
;   16-bit Divisor



; The dividend is assumed to be 64 bits long and in the EDX:EAX registers. The high order 32 bits are in EDX
; and the low order 32 bits are in EAX. After division, the 32 bit quotient goes to the EAX register and the 32 bit
; remainder goes to the EDX register.
;
;  64-bit divident
;     EAX  EDX       Quotient   Remainder
; ---------------- =  [EAX]  And  [EDX]
;   32-bit Divisor

