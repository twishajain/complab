data segment
        num1 dw 2141h
        num2 dw 1138h
        res dw ?
        borrow db ?
        data ends
        code segment
        assume cs:code,ds:data
        start:
        mov ax,data
        mov ds,ax
        mov cx,2
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

