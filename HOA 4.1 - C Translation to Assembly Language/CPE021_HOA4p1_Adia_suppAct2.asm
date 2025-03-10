.model small
.stack 100h
.data
    asterisk db '*$'    ; Define asterisk character with $ terminator for DOS output

.code
main proc
    mov ax, @data       ; Initialize data segment
    mov ds, ax
    
    call print_proc     ; Call the print function
    
    mov ah, 01h         ; Wait for a key press (equivalent to getch())
    int 21h
    
    mov ah, 4Ch         ; Return to DOS (equivalent to return 0)
    int 21h
main endp

print_proc proc
    mov cx, 1           ; Initialize cx = 1 (counter variable)
    
print_loop:
    cmp cx, 5           ; Compare cx with 5
    jg exit_print       ; If cx > 5, exit the loop
    
    ; Print asterisk
    mov ah, 09h         ; DOS function to print string
    mov dx, offset asterisk    ; Load address of asterisk (replaced lea with mov offset)
    int 21h
    
    inc cx              ; Increment cx (cx++)
    jmp print_loop      ; Repeat the loop
    
exit_print:
    ret                 ; Return from procedure
print_proc endp

end main