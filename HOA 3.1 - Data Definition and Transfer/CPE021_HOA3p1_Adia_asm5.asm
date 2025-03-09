.model small
.stack 100h
.data
    promptMsg db "Enter a String: $"
    inputStr db 30, 0, 30 dup(0)  ; First byte is buffer size, second will store length
    newline db 0dh, 0ah, '$'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display prompt
    mov dx, offset promptMsg
    mov ah, 09h
    int 21h

    ; Read user input
    mov dx, offset inputStr
    mov ah, 0Ah
    int 21h

    ; Display newline
    mov dx, offset newline
    mov ah, 09h
    int 21h

    ; Properly terminate the input string with '$'
    mov bl, inputStr+1        ; Get length of input
    mov bh, 0
    mov byte ptr [inputStr+bx+2], '$'  ; Add $ terminator at the end of actual input

    ; Display the string first time
    mov dx, offset inputStr+2
    mov ah, 09h
    int 21h

    ; Display the string second time (immediately after)
    mov dx, offset inputStr+2
    mov ah, 09h
    int 21h

    ; Terminate program
    mov ax, 4c00h
    int 21h
    
main endp
end main

