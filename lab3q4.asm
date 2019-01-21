data segment
        num1 dw 122fh
        num2 dw 70f7h
        result dw ?
        borrow db ?
data ends
code segment
assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax
        lea si,num1
        lea di,num2
        lea bx,result
        mov ax,[si]
        clc
        sbb ax,[di]
        mov [bx],ax
        adc borrow,0
        mov ah,4ch
        int 21h
        code ends
        end start


