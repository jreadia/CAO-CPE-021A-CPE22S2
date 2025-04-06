TITLE supp3.asm
.model small
.stack 100h

.code
main proc
    ; Initialize AX with a test value
    mov ax, 0Ah

    ; Save the original value
    mov cx, ax

    ; Calculate 8*ax (shift left by 3)
    shl ax, 1
    shl ax, 1
    shl ax, 1

    ; Calculate 2*ax (shift left by 1)
    mov dx, cx
    shl dx, 1

    ; Add 8*ax + 2*ax to get 10*ax
    add ax, dx

    ; Print the value in AX
    call print_number

    ; Exit program
    mov ah, 4Ch
    int 21h

; Subroutine to print a number in AX
print_number proc
    xor cx, cx
    mov bx, 10

convert_loop:
    xor dx, dx
    div bx
    push dx
    inc cx
    test ax, ax
    jnz convert_loop

print_digits:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop print_digits

    ret
print_number endp

main endp
end main
