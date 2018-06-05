global _start

section .bss
	num resb 1

section .text
_start:
	mov ecx, 10	; loop times
	mov eax, '1'	; loop start with '1'
next:
	mov [num], eax
	push ecx	; push the value of ecx to stack

	mov eax, 4	; sys call write
	mov ebx, 1	; stdout
	mov ecx, num	; write number
	mov edx, 1	; length of num
	int 0x80	; call kernel
	
	mov eax, [num]	; Move the value of num to eax
	sub eax, '0'	; Convert char to number
	inc eax		; Increase the value
	add eax, '0'	; Convert the number to char
	pop ecx		; Restore ecx value
	loop next	

	; exit
	mov eax, 1
	mov ebx, 0
	int 0x80

; The LOOP instruction assumes that the ECX register contains the loop count. When the loop instruction is executed, the
; ECX register is decremented and the control jumps to the target label, until the ECX register value, i.e., the
; counter reaches the value zero.
