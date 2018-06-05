section .text
	global main
main:
	mov edx, len
	mov ecx, msg	; At most one of the operands can be a memory operand
	mov ebx, 1
	mov eax, 4
	int 0x80
	mov eax, 1
	int 0x80

section .data

; =======
; Quick review,

; DB - Define Byte. 8 bits
; DW - Define Word. Generally 2 bytes on a typical x86 32-bit system
; DD - Define double word. Generally 4 bytes on a typical x86 32-bit system
; [variable-name]    define-directive    initial-value   [,initial-value]...
msg db 'Hello World!', 0xa ; 0xa == '\n'

; The EQU directive is used to tell the assembler that you wish to have a named
; symbolic constant (often computed from other assembler values including other
; EQU definitions) that you can refer to in other places in the assembly source
; text. You must always write

; symbolname EQU constantexpression

; This allows you to write symbolname instead of the constantexpression in other
; places in your source text. But this name by itself has no direct effect on the
; final assembled program binary data.
; https://stackoverflow.com/questions/11672666/equ-vs-dc-b-what-is-the-difference

len equ $ - msg ;length of previous list.

; In assemblers, symbol $ usually means two different things:

; Prefixing a number, means that this number is written in hexadecimal.
;
; By itself, $ is a numeric expression that evaluates as "the current position",
; that is, the address where the next instruction/data would be assembled.
; https://stackoverflow.com/questions/20408884/what-does-mean-in-assembly


; compile the code
; nasm -f elf hello_world.asm
;
; link with ld
; ld -m elf_i386  --entry main -s -o hello hello_world.o

