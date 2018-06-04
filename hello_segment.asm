; A segmented memory model divides the system memory into groups of independent segments, referenced by
; pointers located in the segment registers. Each segment is used to contain a specific type of data. One segment
; is used to contain instruction codes, another segment stores the data elements, and a third segment keeps the
; program stack.

; *Data segment - it is represented by .data section and the .bss. The .data section is used to declare the
;  memory region where data elements are stored for the program. This section cannot be expanded after the
;  data elements are declared, and it remains static throughout the program.
;  The .bss section is also a static memory section that contains buffers for data to be declared later in the
;  program. This buffer memory is zero-filled.

; *Code segment - it is represented by .text section. This defines an area in memory that stores the instruction
;  codes. This is also a fixed area.
; *Stack - this segment contains data values passed to functions and procedures within the program.

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

