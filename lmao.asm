bits 32
org 0x10000

ehdr:
    db 0x7F, "ELFdavy wybiral"
    dw 2, 3
    dd 1, _part1, phdr - $$
_part1:
    mov ebx, 0x02       ; starting PID
    jmp _part2
    db 0x00, 0x00, 0x00
    dw phdrsize
phdr:
    dd 1, 0
ehdrsize equ  $ - ehdr
    dd $$, $$, filesize, filesize, 7, 0x1000
phdrsize equ  $ - phdr

_part2:
    mov eax, 0x25
    mov ecx, 0x09
    int 0x80
    inc ebx
    jmp _part2

filesize      equ     $ - $$