.model small
.stack 100h
.data
    prompt1 db "Hello, What's your name? $"
    prompt2 db "Hello, $"
    congrats db "Congratulations! Your first program is working!$"
    username db 30 dup('$')
    newline db 0dh, 0ah, '$'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display prompt1
    mov dx, offset prompt1
    mov ah, 09h
    int 21h

    ; Read user input
    mov dx, offset username
    mov ah, 0Ah
    int 21h

    ; Display newline
    mov dx, offset newline
    mov ah, 09h
    int 21h

    ; Display prompt2
    mov dx, offset prompt2
    mov ah, 09h
    int 21h

    ; Display username
    mov dx, offset username + 1
    mov ah, 09h
    int 21h

    ; Display newline
    mov dx, offset newline
    mov ah, 09h
    int 21h

    ; Display congrats message
    mov dx, offset congrats
    mov ah, 09h
    int 21h

    ; Terminate program
    mov ax, 4c00h
    int 21h
    
main endp
end main
