# Variables

## Allocating Storage Space for Initialized Data


|Directive |            Purpose          | Storage Space
|:--------:|:---------------------------:|:-------------:|
|DB        | Define Byte allocates       | 1 byte        |
|DW        | Define Word allocates       | 2 bytes       |
|DD        | Define Doubleword allocates | 4 bytes       |
|DQ        | Define Quadword allocates   | 8 bytes       |
|DT        | Define Ten Bytes allocates  | 10 bytes      |


## Allocating Storage Space for Uninitialized Data


|Directive | Purpose
|:--------:|:---------------------:|
|   RESB   | Reserve a Byte        |
|   RESW   | Reserve a Word        |
|   RESD   | Reserve a Doubleword  |
|   RESQ   | Reserve a Quadword    |
|   REST   | Reserve a Ten Bytes   |
