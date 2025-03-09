.model small
.stack 100h
.data
    byte1 db 1
    byte2 db 0
    word1 dw 1234h
    word2 dw 0
    string db "Stressed!", 0dh, 0ah, "$"

;---- this is a comment
.code
main proc
    mov ax, @data
    mov ds, ax

    ; Print the original string
    mov dx, offset string
    mov ah, 9
    int 21h

    ; Reverse the string
    mov si, offset string
    
    ; Swap first and last characters ('S' and '!')
    mov al, [si]
    mov bl, [si+8]
    mov [si], bl
    mov [si+8], al
    
    ; Swap second and second-to-last characters ('t' and 'd')
    mov al, [si+1]
    mov bl, [si+7]
    mov [si+1], bl
    mov [si+7], al
    
    ; Swap third and third-to-last characters ('r' and 'e')
    mov al, [si+2]
    mov bl, [si+6]
    mov [si+2], bl
    mov [si+6], al
    
    ; Swap fourth and fourth-to-last characters ('e' and 's')
    mov al, [si+3]
    mov bl, [si+5]
    mov [si+3], bl
    mov [si+5], al
    
    ; Middle character ('s' at position 4) remains unchanged

    ; Print the reversed string
    mov dx, offset string
    mov ah, 9
    int 21h

    mov ax, 4c00h
    int 21h

main endp
end main
