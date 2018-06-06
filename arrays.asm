global _start


section .data
arr:		; Define a array [2, 3, 4]
	db 2
	db 3
	db 4

sum:		; sum result
	db 0

section .text
_start:
	mov eax, 3	; Loop times
	mov ebx, arr	; Getting the address of arr
	mov ecx, 0	; init sum result set to 0

sum_it:
	add ecx, [ebx]	; Add each value of array to ecx
	inc ebx		; Shift arr pointer
	dec eax		; decrement loop counter
	jnz sum_it	; Loop
done:
	add ecx, '0'	; Convert number to ASCII
	mov [sum], ecx	; Store sum value to [sum]

display:
	; Print the result
	mov eax, 4
	mov ebx, 1
	mov ecx, sum
	mov edx, 1
	int 0x80

	; Exit
	mov eax, 1
	mov ebx, 0
	int 0x80
