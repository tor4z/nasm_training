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
```
	mov eax, [L]
```
* Puts the content at address L into eax
* Puts 32 bits of content, because eax is a 32-bit register
```
	mov eax, L
```
* Puts the address L into eax
* Puts the 32-bit address L into eax
```
	mov ebx, [eax]
```
* Puts the content at address eax (= L) into ebx
```
	inc eax
```
* Increase eax by one
```
	mov ebx, [eax]
```
* Puts the content at address eax (= L + 1) into ebx

### CLC, CLD, CLI, CLTS: Clear Flags

```
CLC                           ; F8                   [8086] 
CLD                           ; FC                   [8086] 
CLI                           ; FA                   [8086] 
CLTS                          ; 0F 06                [286,PRIV]
```
These instructions clear various flags. CLC clears the carry flag; CLD clears the direction flag;
CLI clears the interrupt flag (thus disabling interrupts); and CLTS clears the task-switched (TS) flag in CR0.
[More Detail](http://www.cburch.com/csbsju/cs/350/docs/nasm/nasmdoca.html#section-A.15)


### STC, STD, STI: Set Flags

```
STC                           ; F9                   [8086] 
STD                           ; FD                   [8086] 
STI                           ; FB                   [8086]
```

These instructions set various flags. STC sets the carry flag; STD sets the direction flag; and STI sets the interrupt flag (thus enabling interrupts).
[More Detail](http://www.cburch.com/csbsju/cs/350/docs/nasm/nasmdoca.html#section-A.156)

### ADC instruction in ASM 8086

Few things about the 8086 ADC instruction:
```
Syntax: adc dest, src
dest: memory or register
src:  memory, register, or immediate
Action: dest = dest + src + CF
```

### POP/PUSH

POP - Pop Word off Stack

Usage: 

	POP dest

Modifies Flags: None

Transfers word at the current stack top (SS:SP) to the destination then increments SP by two to point to the new stack top.
CS is not a valid destination.

---

POPA/POPAD - Pop All Registers onto Stack (80188+)

Usage: 

	POPA
	POPAD (386+)

Modifies Flags: None

Pops the top 8 words off the stack into the 8 general purpose 16/32 bit registers. Registers are popped in the following order:
(E)DI, (E)SI, (E)BP, (E)SP, (E)DX, (E)CX and (E)AX. The (E)SP value popped from the stack is actually discarded.

---

POPF/POPFD - Pop Flags off Stack

Usage: 	

	POPF
	POPFD (386+)

Modifies Flags: All

Pops word/doubleword from stack into the Flags Register and then increments SP by 2 (for POPF) or 4 (for POPFD).

---

PUSH - Push Word onto Stack

Usage: 

	PUSH src	
	PUSH immed (80188+ only)

Modifies Flags: None

Decrements SP by the size of the operand (two or four, byte values are sign extended) and transfers one word from source to the stack top (SS:SP).

---

PUSHA/PUSHAD - Push All Registers onto Stack (80188+)

Usage: 

	PUSHA
	PUSHAD (386+)

Modifies Flags: None

Pushes all general purpose registers onto the stack in the following order: (E)AX, (E)CX, (E)DX, (E)BX, (E)SP, (E)BP, (E)SI, (E)DI.
The value of SP is the value before the actual push of SP.

---

PUSHF/PUSHFD - Push Flags onto Stack

Usage:
 
	PUSHF
	PUSHFD (386+)

Modifies Flags: None

Transfers the Flags Register onto the stack. PUSHF saves a 16 bit value while PUSHFD saves a 32 bit value.

[More Detail](http://www.penguin.cz/~literakl/intel/p.html)
