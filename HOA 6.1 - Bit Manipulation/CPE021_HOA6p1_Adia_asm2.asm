TITLE bit.asm
.model small
.stack 100h

.data
num db 0ah

.code
main proc
    mov ax, @data
    mov ds, ax
    mov bl, num
    mov cx, 8

here: 
    shr bl, 1
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