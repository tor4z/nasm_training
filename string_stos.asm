global _start

section .data
	msg db 'HELLO WORLD', 0	; msg end with '\0'
	msgLen equ $ - msg	; msg length


section .bss
	res resb 20		; Reserve 20 byte to store result


section .text
_start:
	mov ecx, msgLen		; Set loop times
	mov edi, res 		; Set source pointer ES:EDI
	mov esi, msg		; Set Destination pointer DS:ESI

loop_shift:			; Defien loop
	lodsb			; load string from DS:ESI to al one byte by one byte
	or al, 20H		; or al with 20H, Upper case
	stosb			; Store string from al to DS:ESI one byte by one byte
	loop loop_shift		; loop msgLen times

	cld			; clean direction flag
	rep movsb		; repeat move string from DS:ESI to ES:EDI one byte by one byte
	
	; Print result
	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 20
	int 0x80

	; Exit
	mov eax, 1
	mov ebx, 0
	int 0x80
	
; The direction flag is a flag that controls the left-to-right or right-to-left direction of string processing,
; stored in the FLAGS register on all x86-compatible CPUs. It is bit number 10.	
;
; If it is set to 0 (using the clear-direction-flag instruction CLD) — it means that string is processed beginning
; from lowest to highest address; such instructions mode is called auto-incrementing mode. Both the source index
; and destination index (like MOVS) will increase them;
;
; In case it is set to 1 (using the set-direction-flag instruction STD) — the string is processed from highest to
; lowest address.This is called auto-decrementing mode.
;

