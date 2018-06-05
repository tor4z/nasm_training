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
       31                             16 15            8 7              0

| 32bit|               16bit            |      8bit     |      8bit     |
|:----:|:------------------------------:|:-------------:|:-------------:|
|  EAX |                                |       AH      |       AL      | AX accumulator register
|  EBX |                                |       BH      |       BL      | BX base register
|  ECX |                                |       CH      |       CL      | CX count register
|  EDX |                                |       DH      |       DL      | DX data register


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


## control register

* Overflow Flag (OF): indicates the overflow of a high-order bit (leftmost bit) of data after a signed arithmetic
operation.
* Direction Flag (DF): determines left or right direction for moving or comparing string data. When the DF
value is 0, the string operation takes left-to-right direction and when the value is set to 1, the string operation
takes right-to-left direction.
* Interrupt Flag (IF): determines whether the external interrupts like, keyboard entry etc. are to be ignored or
processed. It disables the external interrupt when the value is 0 and enables interrupts when set to 1.
* Trap Flag (TF): allows setting the operation of the processor in single-step mode. The DEBUG program we
used sets the trap flag, so we could step through the execution one instruction at a time.
* Sign Flag (SF): shows the sign of the result of an arithmetic operation. This flag is set according to the sign
of a data item following the arithmetic operation. The sign is indicated by the high-order of leftmost bit. A
positive result clears the value of SF to 0 and negative result sets it to 1.
* Zero Flag (ZF): indicates the result of an arithmetic or comparison operation. A nonzero result clears the
zero flag to 0, and a zero result sets it to 1.
* Auxiliary Carry Flag (AF): contains the carry from bit 3 to bit 4 following an arithmetic operation; used for
specialized arithmetic. The AF is set when a 1-byte arithmetic operation causes a carry from bit 3 into bit 4.
* Parity Flag (PF): indicates the total number of 1-bits in the result obtained from an arithmetic operation. An
even number of 1-bits clears the parity flag to 0 and an odd number of 1-bits sets the parity flag to 1.
* Carry Flag (CF): contains the carry of 0 or 1 from a high-order bit (leftmost) after an arithmetic operation. It
also stores the contents of last bit of a shift or rotate operation.


-----

# x86 Registers


The main tools to write programs in x86 assembly are the processor registers. The registers are like variables built in the processor. Using registers instead of memory to store values makes the process faster and cleaner. The problem with the x86 serie of processors is that there are few registers to use. This section describes the main use of each register and ways to use them. That in note that the rules described here are more suggestions than strict rules. Some operations need absolutely some kind of registers but most of the you can use any of the freely. 

Here is a list of the available registers on the 386 and higher processors. This list shows the 32 bit registers. Most of the can be broken down to 16 or even 8 bits register.

```
General registers
EAX EBX ECX EDX

Segment registers
CS DS ES FS GS SS

Index and pointers
ESI EDI EBP EIP ESP

Indicator
EFLAGS
```

###General registers 

As the title says, general register are the one we use most of the time Most of the instructions perform on these registers. They all can be broken down into 16 and 8 bit registers.

32 bits :  EAX EBX ECX EDX
16 bits : AX BX CX DX
 8 bits : AH AL BH BL CH CL DH DL

The "H" and "L" suffix on the 8 bit registers stand for high byte and low byte. With this out of the way, let's see their individual main use

EAX,AX,AH,AL : Called the Accumulator register. 
               It is used for I/O port access, arithmetic, interrupt calls,
               etc...

EBX,BX,BH,BL : Called the Base register
               It is used as a base pointer for memory access
               Gets some interrupt return values

ECX,CX,CH,CL : Called the Counter register
               It is used as a loop counter and for shifts
               Gets some interrupt values

EDX,DX,DH,DL : Called the Data register
               It is used for I/O port access, arithmetic, some interrupt 
               calls.

### Segment registers 

Segment registers hold the segment address of various items. They are only available in 16 values. They can only be set by a general register or special instructions. Some of them are critical for the good execution of the program and you might want to consider playing with them when you'll be ready for multi-segment programming

CS         : Holds the Code segment in which your program runs.
             Changing its value might make the computer hang.

DS         : Holds the Data segment that your program accesses.
             Changing its value might give erronous data.

ES,FS,GS   : These are extra segment registers available for
             far pointer addressing like video memory and such.

SS         : Holds the Stack segment your program uses.
             Sometimes has the same value as DS.
             Changing its value can give unpredictable results,
             mostly data related.

### Indexes and pointers 

Indexes and pointer and the offset part of and address. They have various uses but each register has a specific function. They some time used with a segment register to point to far address (in a 1Mb range). The register with an "E" prefix can only be used in protected mode.

ES:EDI EDI DI : Destination index register
                Used for string, memory array copying and setting and
                for far pointer addressing with ES

DS:ESI EDI SI : Source index register
                Used for string and memory array copying

SS:EBP EBP BP : Stack Base pointer register
                Holds the base address of the stack
                
SS:ESP ESP SP : Stack pointer register
                Holds the top address of the stack

CS:EIP EIP IP : Index Pointer
                Holds the offset of the next instruction
                It can only be read 

The EFLAGS register 

The EFLAGS register hold the state of the processor. It is modified by many intructions and is used for comparing some parameters, conditional loops and conditionnal jumps. Each bit holds the state of specific parameter of the last instruction. Here is a listing :

|Bit|   Label|    Desciption|
|:-----:|:-----:|:------------:|
|0      |CF     | Carry flag|
|2      |PF     | Parity flag|
|4      |AF     | Auxiliary carry flag|
|6      |ZF     | Zero flag|
|7      |SF     | Sign flag|
|8      |TF     | Trap flag|
|9      |IF     | Interrupt enable flag|
|10     |DF     | Direction flag|
|11     |OF     | Overflow flag|
|12-13  |IOPL   | I/O Priviledge level|
|14     |NT     | Nested task flag|
|16     |RF     | Resume flag|
|17     |VM     | Virtual 8086 mode flag|
|18     |AC     | Alignment check flag (486+)|
|19     |VIF    | Virutal interrupt flag|
|20     |VIP    | Virtual interrupt pending flag|
|21     |ID     | ID flag|

Those that are not listed are reserved by Intel.

Undocumented registers 

There are registers on the 80386 and higher processors that are not well documented by Intel. These are divided in control registers, debug registers, test registers and protected mode segmentation registers. As far as I know, the control registers, along with the segmentation registers, are used in protected mode programming, all of these registers are available on 80386 and higher processors except the test registers that have been removed on the pentium. Control registers are CR0 to CR4, Debug registers are DR0 to DR7, test registers are TR3 to TR7 and the protected mode segmentation registers are GDTR (Global Descriptor Table Register), IDTR (Interrupt Descriptor Table Register), LDTR (Local DTR), and TR.


## References

http://www.eecg.toronto.edu/~amza/www.mindsec.com/files/x86regs.html
