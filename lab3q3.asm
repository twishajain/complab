data segment
        num1 dd 12345678H
        num2 dd 0f129abc5h
        result dd ?
        carry db ?
data ends
code segment
        assume cs:code,ds:data
        start:
        mov ax,data
        mov ds,ax
        clc
        mov cx,2
        mov si,0
        back:
        mov ax,word ptr num1[si]
        adc ax,word ptr num2[si]
        mov word ptr result[si],ax
        inc si
        inc si
        loop back
        adc carry,0
        mov ah,4ch
        int 21h
        code ends
        end start

