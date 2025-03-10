.model small
.stack 100h

.data
    ; initial test values (these can be changed)
    ah_val  db  10101010b   ; example value for ah
    bh_val  db  11001100b   ; example value for bh
    al_val  db  11110000b   ; example value for al
    bl_val  db  00001111b   ; example value for bl
    ch_val  db  10101010b   ; example value for ch
    dh_val  db  01010101b   ; example value for dh
    cl_val  db  11110000b   ; example value for cl
    dl_val  db  00001111b   ; example value for dl
    result  db  ?           ; variable to store final result

.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; load test values into registers
    mov ah, ah_val
    mov bh, bh_val
    mov al, al_val
    mov bl, bl_val
    mov ch, ch_val
    mov dh, dh_val
    mov cl, cl_val
    mov dl, dl_val
    
    ; part 1: calculate (ah∙bh + al∙bl)'
    ; store ah value temporarily
    push ax
    
    ; calculate ah∙bh
    mov al, ah      ; move ah to al for and operation
    and al, bh      ; al = ah∙bh
    mov bh, al      ; store ah∙bh in bh temporarily
    
    ; restore ah and calculate al∙bl
    pop ax
    push ax         ; save ax again
    and al, bl      ; al = al∙bl
    
    ; perform or operation: al = ah∙bh + al∙bl
    or al, bh       ; al = (ah∙bh) + (al∙bl)
    
    ; perform not operation: al = (ah∙bh + al∙bl)'
    not al          ; al = (ah∙bh + al∙bl)'
    
    ; store the result temporarily
    mov bl, al
    
    ; part 2: calculate (cl+(ch∙dh)'∙dl)'
    mov al, ch
    and al, dh      ; al = ch∙dh
    not al          ; al = (ch∙dh)'
    
    ; calculate (ch∙dh)'∙dl
    and al, dl      ; al = (ch∙dh)'∙dl
    
    ; perform or operation with cl
    or al, cl       ; al = cl+(ch∙dh)'∙dl
    
    ; perform not operation
    not al          ; al = (cl+(ch∙dh)'∙dl)'
    
    ; part 3: xor the two results
    xor al, bl      ; al = (ah∙bh + al∙bl)' xor (cl+(ch∙dh)'∙dl)'
    
    ; store the final result
    mov result, al
    
    ; exit program
    mov ax, 4c00h
    int 21h
main endp
end main
