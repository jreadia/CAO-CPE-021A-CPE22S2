TITLE Triangle.asm
.model small
.stack 100h
.data
    ; No variables needed for this program
.code
main PROC
    mov ax, @data 
    mov ds, ax
    
    mov cl, 1 
    mov bl, 0
    mov ch, 4

looprow: cmp ch, 0
         jg loopcol
         jmp quit

loopcol: cmp bl, cl
         jl dsplay
         jmp next

dsplay:  mov ah, 2h
         mov dl, '*'    ;display asterisk
         int 21h
         inc bl
         jmp loopcol

next:    mov dl, 0Ah
         int 21h       ;next line
         mov dl, 0Dh
         int 21h

         mov bl, 0
         dec ch
         inc cl
         jmp looprow
         
quit:    mov ax, 4C00h  
         int 21h       
main ENDP
END main
