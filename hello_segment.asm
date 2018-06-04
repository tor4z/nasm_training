segment .text
	global main
main:
	mov edx, len
	mov ecx, msg
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov eax, 1
	int 0x80

segment .data
msg	db 'Hello World!', 0xa
len	equ	$ - msg

; nasm -f elf hello_segment.asm
; ld -m elf_i386 --entry main hello_segment.o
;

