global _start

section .data
	eqMsg db 'Equal', 0xA
	eqMsgLen equ $ - eqMsg

	neqMsg db 'Not equal', 0xA
	neqMsgLen equ $ - neqMsg
	
section .bss
	res resb 10

section .text
_start:
	mov eax, es	; Getting value of es to eax
	mov ebx, ds	; Getting value of ds to ebx
	cmp eax, ebx	; Compare value of eax with ebx
	je eq		; If eax == ebx , jump to eq
	jmp neq		; Else jump to neq

eq:			; Print Equal msg
	mov eax, 4
	mov ebx, 1
	mov ecx, eqMsg
	mov edx, eqMsgLen
	int 0x80
	jmp exit

neq:			; Print not equal msg
	mov eax, 4
	mov ebx, 1
	mov ecx, neqMsg
	mov edx, neqMsgLen
	int 0x80
	jmp exit

exit:			; Exit
	mov eax, 1
	mov ebx, 0
	int 0x80
