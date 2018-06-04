# Processor Registers

There are ten 32-bit and six 16-bit processor registers in IA-32 architecture. The registers are grouped into three

### Categories:

* General registers
* Control registers
* Segment registers

The general registers are further divided into the following groups:

* Data registers
* Pointer registers
* Index registers

32-bit register                                                   16-bit register
   31			          16 15            8 7              0
   ----------------------------------------------------------------------
EAX|                                |       AH      |       AL      | AX accumulator register
   ----------------------------------------------------------------------
EBX|                                |       BH      |       BL      | BX base register
   ----------------------------------------------------------------------
ECX|                                |       CH      |       CL      | CX count register
   ----------------------------------------------------------------------
EDX|                                |       DH      |       DL      | DX data register
   ----------------------------------------------------------------------


## Data Registers

1. As complete 32-bit data registers: EAX, EBX, ECX, EDX.
2. Lower halves of the 32-bit registers can be used as four 16-bit data registers: AX, BX, CX and DX.
3. Lower and higher halves of the above-mentioned four 16-bit registers can be used as eight 8-bit data
registers: AH, AL, BH, BL, CH, CL, DH, and DL.

* AX is the primary accumulator; it is used in input/output and most arithmetic instructions. For example, in
multiplication operation, one operand is stored in EAX, or AX or AL register according to the size of the operand.
* BX is known as the base register as it could be used in indexed addressing.
* CX is known as the count register as the ECX, CX registers store the loop count in iterative operations.
* DX is known as the data register. It is also used in input/output operations. It is also used with AX register along
with DX for multiply and divide operations involving large values.

## Pointer Registers

The pointer registers are 32-bit EIP, ESP and EBP registers and corresponding 16-bit right portions: IP, SP and
BP. There are three categories of pointer registers:

* Instruction Pointer (IP) - the 16-bit IP register stores the offset address of the next instruction to be
executed. IP in association with the CS register (as CS:IP) gives the complete address of the current
instruction in the code segment.
* Stack Pointer (SP) - the 16-bit SP register provides the offset value within the program stack. SP in
association with the SS register (SS:SP) refers to be current position of data or address within the program stack.
* Base Pointer (BP) - the 16-bit BP register mainly helps in referencing the parameter variables passed to a
subroutine. The address in SS register is combined with the offset in BP to get the location of the parameter.
BP can also be combined with DI and SI as base register for special addressing.

## Index Registers

The 32-bit index registers ESI and EDI and their 16-bit rightmost portions SI and DI are used for indexed
addressing and sometimes used in addition and subtraction. There are two sets of index pointers:

* Source Index (SI) - it is used as source index for string operations
* Destination Index (DI) - it is used as destination index for string operations.
