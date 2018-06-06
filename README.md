# NASM SEL


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


### Assembly Numbers

#### ASCII Representation

In ASCII representation, decimal numbers are stored as string of ASCII characters. For example, the decimal
value 1234 is stored as:
```
31 32 33 34H
```
Where, 31H is ASCII value for 1, 32H is ASCII value for 2, and so on. There are the following four instructions for
processing numbers in ASCII representation:
```
 AAA - ASCII Adjust After Addition
 AAS - ASCII Adjust After Subtraction
 AAM - ASCII Adjust After Multiplication
 AAD - ASCII Adjust Before Division
```

#### BCD Representation

There are two types of BCD representation:

* Unpacked BCD representation
* Packed BCD representation

In unpacked BCD representation, each byte stores the binary equivalent of a decimal digit. For example, the
number 1234 is stored as:
```
01 02 03 04H
```
There are two instructions for processing these numbers:
```
AAM - ASCII Adjust After Multiplication
AAD - ASCII Adjust Before Division
```
The four ASCII adjust instructions, AAA, AAS, AAM and AAD can also be used with unpacked BCD
representation. In packed BCD representation, each digit is stored using four bits. Two decimal digits are packed
into a byte. For example, the number 1234 is stored as:
```
12 34H
```
There are two instructions for processing these numbers:
```
DAA - Decimal Adjust After Addition
DAS - decimal Adjust After Subtraction
```
There is no support for multiplication and division in packed BCD representation.

### SECTION or SEGMENT: Changing and Defining Sections

The SECTION directive (SEGMENT is an exactly equivalent synonym) changes which section of the output file the code
you write will be assembled into. In some object file formats, the number and names of sections are fixed; in others,
the user may make up as many as they wish. Hence SECTION may sometimes give an error message, or may define a new
section, if you try to switch to a section that does not (yet) exist.

The Unix object formats, and the bin object format, all support the standardized section
names .text, .data and .bss for the code, data and uninitialized-data sections. The obj format, by contrast,
does not recognize these section names as being special, and indeed will strip off the leading period of any
section name that has one.


### Repeat String Operation Prefix

Repeats a string instruction the number of times specified in the count register ((E)CX) or until the indicated condition of the
ZF flag is no longer met. The REP (repeat), REPE (repeat while equal), REPNE (repeat while not equal), REPZ (repeat while zero),
and REPNZ (repeat while not zero) mnemonics are prefixes that can be added to one of the string instructions. The REP prefix can
be added to the INS, OUTS, MOVS, LODS, and STOS instructions, and the REPE, REPNE, REPZ, and REPNZ prefixes can be added to the
CMPS and SCAS instructions. (The REPZ and REPNZ prefixes are synonymous forms of the REPE and REPNE prefixes, respectively.) The
behavior of the REP prefix is undefined when used with non-string instructions. [More detail](https://c9x.me/x86/html/file_module_x86_id_279.html)


|Repeat Prefix  | Termination Condition 1| Termination Condition 2  |
|:-------------:|:----------------------:|:------------------------:|
|REP		|     	ECX=0		 |			None|
|REPE/REPZ	|	ECX=0		 |			ZF=0|
|REPNE/REPNZ	|	ECX=0		 | 			ZF=1|


### Registers

What is registers exactly? You can consider it as variables inside the CPU chip. Yeah! That depicts registers so close.
There are several registers exist in PC:

AX, BX, CX, DX, CS, DS, ES, SS, SP, BP, SI, DI, Flags, and IP

They are all 16-bits. You can treat it as if they are word (or unsigned integer) variables. However, each registers has its own use.

AX, BX, CX, and DX are general purpose registers. They can be assigned to any value you want. Of course you need to adjust it into your need.
AX is usually called accumulator register, or just accumulator. Most of arithmatical operations are done with AX. Sometimes other general
purpose registers can also be involved in arithmatical operation, such as DX. The register BX is usually called base register.
The common use is to do array operations. BX is usually worked with other registers, most notably SP to point to stacks. The register CX is
commonly called counter register. This register is used for counter purposes. That's why our PC can do looping. DX register is the data register.
It is usually for reserving data value.

The registers CS, DS, ES, and SS are called segment registers. You may not fiddle with these registers. You can only use them in the correct ways only.
CS is called code segment register. It points to the segment of the running program. We may NOT modify CS directly. Oh yes, what is "segment" anyway?
It's discussed later. :-) DS is called data segment register. It points to the segment of the data used by the running program. You can point this to
anywhere you want as long as it contains the desired data. ES is called extra segment register. It is usually used with DI and doing pointers things.
The couple DS:SI and ES:DI are commonly used to do string operations. SS is called stack segment register. It points to stack segment.

The register SI and DI are called index registers. These registers are usually used to process arrays or strings. SI is called source index and DI
is destination index. As the name follows, SI is always pointed to the source array and DI is always pointed to the destination. This is usually
used to move a block of data, such as records (or structures) and arrays. These register is commonly coupled with DS and ES.

The register BP, SP, and IP are called pointer registers. BP is base pointer, SP is stack pointer, and IP is instruction pointer. Usually BP is
used for preserving space to use local variables. SP is used to point the current stack. Although SP can be modified easily, you must be cautious.
It's because doing the wrong thing with this register could cause your program in ruin. IP denotes the current pointer of the running program.
It is always coupled with CS and it is NOT modifiable. So, the couple of CS:IP is a pointer pointing to the current instruction of running program.
You can NOT access CS nor IP directly. [See also](http://www.baskent.edu.tr/~tkaracay/etudio/ders/prg/pascal/PasHTM2/pas/lowlevel.html)

### Segment register 

In real mode each logical address points directly into physical memory location, every logical address consists of two 16 bit parts: 
The segment part of the logical address contains the base address of a segment with a granularity of 16 bytes, i.e. a segments may start at
physical address 0, 16, 32, ..., 220-16. The offset part of the logical address contains an offset inside the segment, i.e. the physical address
can be calculated as
` physical_address : = segment_part × 16 + offset` (if the address line A20 is enabled), respectively (`segment_part × 16 + offset) mod 220 `
(if A20 is off) Every segment has a size of 216 bytes. [Wikipedia]

The 286 architecture introduced 4 segments: CS (code segment) DS (data segment) SS (stack segment) ES (extra segment) the 386 architecture
introduced two new general segment registers FS, GS.

typical assembly opcode (in Intel syntax) would look like:

```
mov dx, 850h
mov es, dx     ; Move 850h to es segment register
mov es:cx, 15h ; Move 15 to es:cx
```
[See also](https://reverseengineering.stackexchange.com/questions/2006/how-are-the-segment-registers-fs-gs-cs-ss-ds-es-used-in-linux)


### Repetition Prefixes

The REP prefix, when set before a string instruction, for example - REP MOVSB, causes repetition of the
instruction based on a counter placed at the CX register. REP executes the instruction, decreases CX by 1, and
checks whether CX is zero. It repeats the instruction processing until CX is zero.

The Direction Flag (DF) determines the direction of the operation.

*Use CLD (Clear Direction Flag, DF = 0) to make the operation left to right.
*Use STD (Set Direction Flag, DF = 1) to make the operation right to left.

The REP prefix also has the following variations:

*REP: it is the unconditional repeat. It repeats the operation until CX is zero.
*REPE or REPZ: It is conditional repeat. It repeats the operation while the zero flag indicate equal/zero. It
 stops when the ZF indicates not equal/zero or when CX is zero.
*REPNE or REPNZ: It is also conditional repeat. It repeats the operation while the zero flag indicate not
 equal/zero. It stops when the ZF indicates equal/zero or when CX is decremented to zero.



## References

Intel Pentium Instruction Set Reference (Basic Architecture Overview) [Link](http://faydoc.tripod.com/cpu/)

