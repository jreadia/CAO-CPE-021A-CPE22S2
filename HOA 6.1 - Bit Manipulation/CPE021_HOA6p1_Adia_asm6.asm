TITLE supp2.asm
.model small
.stack 100h

.code
main proc
    mov ax, 0ABCDh   ; Load a 16-bit value into AX

    ; Clear the most significant nibble
    and ax, 0FFFh  

    ; Set the least significant nibble
    or ax, 000Fh   

    ; Preserve AX by copying it to BX
    mov bx, ax       

    ; Display the result in binary
    mov cx, 16       ; Set loop counter for 16 bits

display_loop:
    shl bx, 1        ; Shift BX left to bring the MSB into the carry flag
    jc print_one     ; If carry flag is set, print '1'
    mov dl, '0'      ; Otherwise, print '0'
    jmp print_char

print_one:
    mov dl, '1'

print_char:
    mov ah, 2        ; DOS interrupt to display a character
    int 21h
    loop display_loop ; Repeat for all 16 bits

    ; Exit program
    mov ax, 4c00h
    int 21h

main endp
end main



