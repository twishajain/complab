Data Segment
        result dw ?
        carry db ?
Data ends
Code segment
assume cs:code,ds:data
start:
        clc
        mov ax,data
        mov ds,ax
        mov ax,0F111h
        mov bx,2222h
        add ax,bx
        lea si,result
        mov [si],ax
        adc carry,0
        mov ah,4ch
        int 21h
        code ends
        end start
