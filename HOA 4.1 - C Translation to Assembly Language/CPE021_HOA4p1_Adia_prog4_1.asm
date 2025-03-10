TITLE prog4_1.asm
Dosseg
.model small
.stack 0100h
.data
.code
    mov ax, @data    
    mov ds, ax
    mov cx, 001Eh    
    mov ah, 02h      ; Request display character
    mov dl, '*'      ; Character to display
    A:  int 21h      ; Call interrupt service
        loop A
    mov ax, 4c00h    ; End
    int 21h
end
