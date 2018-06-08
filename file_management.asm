global _start

section .data
	msg db 'Hello, Welcome to the world of linux!', 0xA	; The msg write to file
	len equ $ - msg						; msg length

	err db 'Error!', 0xA		; Error msg
	errLen equ $ - err		; Error msg length

	filename db 'test.txt'		; Filename

section .bss
	info resb 50			; Reserve 50 byte space to store msg
	fd_in resb 1			; To store in file description
	fd_out resb 1			; To store out file description

section .text
_start:
	; Create file
	mov eax, 8			; sys create
	mov ebx, filename		; The filename to create
	mov ecx, 0777			; File permision
	int 0x80			; call kernel
	cmp eax, 0			; Compare result with 0
	jl error			; If fd less than 0, jump to error
	mov [fd_in], eax		; Else store fd to [fd_in]

	; Write msg to file
	mov eax, 4			; sys write
	mov ebx, [fd_in]		; output file
	mov ecx, msg			; msg to write
	mov edx, len			; msg length to write
	int 0x80			; call kernel

	; Close file
	mov eax, 6			; sys close
	mov ebx, [fd_in]		; File description to close
	int 0x80			; call kernel

	; Open file with read mod
	mov eax, 5			; sys open
	mov ebx, filename		; The file to open
	mov ecx, 0			; Open mod
	mov edx, 0777			; Open permision
	int 0x80			; call kernel
	cmp eax, 0			; compare fd with 0
	jl error			; If result less than 0, jump to error
	mov [fd_out], eax		; Else store file description to fd_out

	; Read string to info
	mov eax, 3			; sys read
	mov ebx, [fd_out]		; The file description to read
	mov ecx, info			; The place to store text read from file
	mov edx, 50			; Read text length
	int 0x80			; call kernel

	; Close file
	mov eax, 6			; sys close
	mov ebx, [fd_out]		; the file description to close
	int 0x80			; call kernel

	; Print info
	mov eax, 4
	mov ebx, 1
	mov ecx, info
	mov edx, 50
	int 0x80
	jmp exit
	
error:
	; Print error msg and exit
	mov eax, 4
	mov ebx, 1
	mov ecx, err
	mov edx, errLen
	int 0x80
	jmp exit

exit:
	; Exit
	mov eax, 1
	mov ebx, 0
	int 0x80


; %eax 	Name 		%ebx 		%ecx 		%edx
; 3 	sys_read 	unsigned int 	char * 		size_t
; 4 	sys_write 	unsigned int 	const char * 	size_t
; 5 	sys_open 	const char * 	int 		int
; 6 	sys_close 	unsigned int 	- 		-
; 8 	sys_creat 	const char * 	int 		-
; 19 	sys_lseek 	unsigned int 	off_t 		unsigned int

