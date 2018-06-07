global _start				; Define entry

section .data
	msg db 'Factorial 3 is: '	; Show result msg
	msgLen equ $ - msg		; msg length


section .bss
	res resb 1			; Reserve 1 byte to store result


section .text
_start:				; fac (n) = n * fac (n-1) for n > 0
	mov bx, 3		; initial n is 3
	call fac_func		; call factorial function
	add eax, '0'		; Convert number to char
	mov [res], eax		; Store result to [res]
	
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

fac_func:
	cmp bx, 1	; n store in ex, compare n with 1
	jg fac_cal	; if n > 1, jump to calcualte n - 1
	mov ax, 1	; else the result is 1
	ret		; return


fac_cal:
	dec bx		; n = n - 1
	call fac_func	; calculate n - 1
	inc bx		; Restore n 
	mul bx		; multiply bx with ax, and the result store in ax
	ret		; return


