section .text
	global main
main:
	mov edx, len
	mov ecx, msg
	mov ebx, 1
	mov eax, 4
	int 0x80
	mov eax, 1
	int 0x80

section .data
msg db 'Hello World!', 0xa
len equ $ - msg

; compile the code
; nasm -f elf hello_world.asm
;
; link with ld
; ld --entry main -s -o hello hello_world.o


