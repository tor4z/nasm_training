## Object File Format

```
        Link View                      Execution View 
|------------------------|      |-------------------------|
|       ELF header       |      |       ELF header        |
|------------------------|      |-------------------------|
| Progrram header table  |      |  Program header table   |
|      (optional)        |      |                         |
|------------------------|      |-------------------------|
|        Section 1       |      |                         |
|------------------------|      |        Segment 1        |
|           ...          |      |                         |
|------------------------|      |-------------------------|
|        Section n       |      |                         |
|------------------------|      |        Segment 2        |
|           ...          |      |                         |
|------------------------|      |-------------------------|
|           ...          |      |           ...           |
|------------------------|      |-------------------------|
|  Section header table  |      |   Section header table  |
|                        |      |       (optional)        |
|------------------------|      |-------------------------|

```

An *ELE header resisdes* at the beginning and holds a "road map" descripting the file's organization.
*setions* hold the bulk of object file information of the linking view: instructions, data, symbol table, 
relocation information, and so on.

A *program header table*, if present telll the system how to create a process image. Files used to build a
process image(execution a program) must have a plrogram header table;relocatable file do not need one.
*A section header table* contains information describing the file's sections.Every section ahs an entry in the
table; each entry gives information such as the section name, the section size, ect. File used during liiking must
have a section header table; other object files may or may not have one.

The plrogram header table immediately ofter ELF header, and the section header table follwing the sections,
actual files may differ. Moreover, Section and Segment have no specified order. Only the ELF header has a
fixed positin in the file.
