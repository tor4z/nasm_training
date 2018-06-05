# nasm SEL


## Quick Notes


### Moving immediate values

Consider the instruction:

	mov [L], 1

The assembler will give us an error: “operation size
not specified”!
Labels have no type (they’re NOT variables)

	mov dword [L], 1	; 4-byte double-word



### Brackets or no Brackets

	mov eax, [L]

* Puts the content at address L into eax
* Puts 32 bits of content, because eax is a 32-bit register

	mov eax, L

* Puts the address L into eax
* Puts the 32-bit address L into eax

	mov ebx, [eax]

* Puts the content at address eax (= L) into ebx

	inc eax

* Increase eax by one

	mov ebx, [eax]

* Puts the content at address eax (= L + 1) into ebx
