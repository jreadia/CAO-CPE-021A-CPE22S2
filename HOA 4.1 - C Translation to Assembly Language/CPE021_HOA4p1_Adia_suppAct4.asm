.model small
.stack 100h

.data
    multiplicand dw 50       ; First number (50 decimal)
    multiplier   db 10       ; Second number (10 decimal)
    result       dw 0        ; To store the multiplication result
    msg          db 'The result of 50 x 10 = $'
    resultStr    db 6 dup('$')  ; Buffer for the result string

.code
main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax
    
    ; Initialize registers
    mov ax, 0              ; Clear AX for result
    mov bx, [multiplicand] ; Load first number (50) into BX
    mov cl, [multiplier]   ; Load second number (10) into CL
    mov ch, 0              ; Clear CH to use CX for loop counter
    
    ; Multiplication loop using addition
    ; We add BX (50) to AX, CX (10) times
multiplyLoop:
    cmp cx, 0              ; Check if counter reached zero
    je displayResult       ; If yes, multiplication is complete
    
    add ax, bx             ; Add multiplicand to result
    dec cx                 ; Decrement counter
    jmp multiplyLoop       ; Repeat
    
displayResult:
    ; Store the result
    mov [result], ax
    
    ; Print the message
    mov ah, 9
    mov dx, offset msg
    int 21h
    
    ; Convert the result to string for display
    mov ax, [result]
    mov cx, 0          ; Digit counter
    mov bx, 10         ; Divisor
    
convertLoop:
    mov dx, 0          ; Clear DX for division
    div bx             ; Divide AX by 10, remainder in DX
    add dl, '0'        ; Convert remainder to ASCII
    push dx            ; Save digit on stack
    inc cx             ; Increment digit counter
    test ax, ax        ; Check if quotient is zero
    jnz convertLoop    ; If not zero, continue converting
    
    ; Pop digits from stack and store in buffer
    mov si, offset resultStr
    
printLoop:
    pop dx             ; Get digit from stack
    mov [si], dl       ; Store in buffer
    inc si             ; Move to next position in buffer
    loop printLoop     ; Repeat for all digits
    
    ; Display the result string
    mov ah, 9
    mov dx, offset resultStr
    int 21h
    
    ; Exit program
    mov ah, 4ch
    int 21h
main endp
end main