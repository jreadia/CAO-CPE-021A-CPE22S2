TITLE supp1.asm
.model small
.stack 100h

.data
; The 64-bit number is split into 4 16-bit segments
num dw 0F0Fh, 0F0Fh, 0F0Fh, 0F0Fh ; 

.code
main proc
    mov ax, @data
    mov ds, ax
    mov cx, 64

here:
    mov ax, num+6
    shl ax, 1
    mov num+6, ax

    mov ax, num+4
    rcl ax, 1
    mov num+4, ax

    mov ax, num+2
    rcl ax, 1
    mov num+2, ax

    mov ax, num
    rcl ax, 1
    mov num, ax

    jc is_one
    mov dl, 30h
    jmp print

is_one:
    mov dl, 31h

print:
    mov ah, 2
    int 21h
    loop here

exit:
    mov ax, 4c00h
    int 21h

main endp
end main