.model small
.stack 100h
.data
    asterisk db '*$'    ; Character to be printed with $ terminator

.code
main proc
    mov ax, @data       ; Initialize data segment
    mov ds, ax
    
    mov cx, 0           ; Initialize loop counter cx = 0
    
for_loop:
    cmp cx, 5           ; Compare cx with 5
    jge end_for         ; Jump to end if cx >= 5
    
    ; Print asterisk
    mov ah, 09h         ; DOS function to display a string
    mov dx, offset asterisk 
    int 21h             ; Call DOS function
    
    inc cx              ; Increment counter (cx++)
    jmp for_loop        ; Continue loop
    
end_for:
    ; Wait for a key press (getch())
    mov ah, 01h         ; DOS function to read a character
    int 21h
    
    ; Exit program
    mov ah, 4ch         ; DOS function to exit program
    mov al, 0           ; Return code 0
    int 21h
main endp
end main