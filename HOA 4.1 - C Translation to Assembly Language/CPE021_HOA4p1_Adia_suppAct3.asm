.model small
.stack 100h

.data
    message db 'Hello World!', '$'    ; Define string with $ terminator for DOS output

.code
main proc
    ; Set up data segment
    mov ax, @data
    mov ds, ax
    
    ; Display message (printf equivalent)
    mov ah, 09h         ; DOS function for printing a string
    mov dx, offset message
    int 21h             ; Call DOS interrupt
    
    ; Wait for keypress (getch equivalent)
    mov ah, 01h         ; DOS function for reading a character
    int 21h             ; Call DOS interrupt
    
    ; Return to DOS (return 0 equivalent)
    mov ah, 4ch         ; DOS function to terminate program
    mov al, 00h         ; Return code 0
    int 21h             ; Call DOS interrupt
main endp
end main