global _start		; Define the entry point


%macro write_str 2	; Define write_str amcro with 2 argument
	mov eax, 4	; System call write
	mov ebx, 1	; Stdout
	mov ecx, %1	; Use the first argument
	mov edx, %2	; Use the second argument
	int 0x80	; Call kernel
%endmacro		; End macro


section .data
	msg1 db 'Hello world!', 0xA				; Define msg1
	msg1Len equ $ - msg1					; Calculate msg1 length

	msg2 db 'Welcome to the world of Assembly!', 0xA	; Define msg2
	msg2Len equ $ - msg2					; Calculate msg2 length

	msg3 db 'Welcome to the world of Linux!', 0xA		; Define msg3
	msg3Len equ $ - msg3					; Calculate msg3 length

section .text
_start:
	write_str msg1, msg1Len		; Write msg1
	write_str msg2, msg2Len		; Write msg2
	write_str msg3, msg3Len		; Write msg3

	; Exit
	mov eax, 1
	mov ebx, 0
	int 0x80
