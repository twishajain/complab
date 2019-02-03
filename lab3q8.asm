data segment
        num1 db 10h,11h,12h,13h,14h,15h,16h,17h,18h,19h
        sum dw ?
data ends
code segment
        assume cs:code,ds:data
        start:
        mov ax,data
        mov ds,ax
        mov cl,0ah
        lea si,num1
        lea di,sum
        clc
        mov ah,0h
        mov al,[si]
        back:
        inc si
        add al,[si]
        adc ah,0
        loop back
        mov [di],ax
        mov ah,4ch
        int 21h
        code ends
        end start

