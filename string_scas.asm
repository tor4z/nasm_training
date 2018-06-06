global _start

section .data
	s db 'Hello world!'			; String to search
	len equ $ - s				; Length of the string

	msgFound db 'Found!', 0xA		; Found msg
	msgFoundLen equ $ - msgFound
	
	msgNotFound db 'Not found!', 0xA	; Not found msg
	msgNotFoundLen equ $ - msgNotFound


section .text
_start:
	mov ecx, len	; Set the argument of rep, repeat times
	mov edi, s	; Source string location ES:DI
	mov al, 'e'	; Search with 'e'
	cld		; Clean direction
	
	repne scasb	; ZF = AL == BYTE PTR[EDI]
	je found	; If found jump to found
	jmp notFound	; Else jump to notFound

found:
	; Print found msg
	mov eax, 4
	mov ebx, 1
	mov ecx, msgFound
	mov edx, msgFoundLen
	int 0x80
	jmp exit		; Jump to exit

notFound:
	; Print not found msg
	mov eax, 4
	mov ebx, 1
	mov ecx, msgNotFound
	mov edx, msgNotFoundLen
	int 0x80
	jmp exit		; Jump to exit

exit:
	; Exit
	mov eax, 1
	mov ebx, 0
	int 0x80


; Compares the byte, word, or double word specified with the memory operand with the value in the AL, AX, or EAX register,
; and sets the status flags in the EFLAGS register according to the results. The memory operand address is read from either
; the ES:EDI or the ES:DI registers (depending on the address-size attribute of the instruction, 32 or 16, respectively).
; The ES segment cannot be overridden with a segment override prefix.
;
;
; Code	Mnemonic	Description
; AE	SCASB		Compare AL with byte at ES:(E)DI and set status flags
; AF	SCASW		Compare AX with word at ES:(E)DI and set status flags
; AF	SCASD		Compare EAX with doubleword at ES:(E)DI and set status flags

