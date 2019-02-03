data segment
        num1 dt 12345678001234567800h
        num2 dt 12345678001222222222h
        res dt ?
        borrow db ?
        data ends
        code segment
        assume cs:code,ds:data
        start:
        mov ax,data
        mov ds,ax
        mov cx,10
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
