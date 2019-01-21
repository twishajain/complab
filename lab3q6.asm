data segment
        num1 dt 12345678aa12345678aah
        num2 dt 12aaaaaaaa12aaaaaaaah
        result dd ?
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
        mov cx,10
        clc
        back:
        mov ax,[si]
        sbb ax,[di]
        mov [bx],ax
        inc si
        inc si
        inc di
        inc di
        inc bx
        inc bx
        loop back
        adc borrow,0
        mov ah,4ch
        int 21h
        code ends
        end start


