Data segment
        num1 db 99h
        num2 db 45h
        sum db ?
        carry db ?
data ends
code segment
        assume cs:code,ds:data
        start:
                mov ax,data
                mov ds,ax
                lea si,num1
                lea di,num2
                lea bx,sum
                clc
                mov al,[si]
                adc al,[di]
                daa
                mov [bx],al
                adc carry,0
                mov ah,4ch
                int 21h
                code ends
                end start
