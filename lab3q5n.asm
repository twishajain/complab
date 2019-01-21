data segment
        num1 dd 12345678h
        num2 dd 11380000h
        res dd ?
        borrow db ?
        data ends
        code segment
        assume cs:code,ds:data
        start:
        mov ax,data
        mov ds,ax
        mov cx,4
        lea si,num1
        lea di,num2
        lea bx,res
        clc
        back:
        mov al,[si]
        sbb al,[di]
        das
        mov [bx],al
        inc si
        inc di
        inc bx
        loop back
        adc borrow,0
        mov ah,4ch
        int 21h
        code ends
        end start

