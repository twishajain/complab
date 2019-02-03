Data Segment
        A dw 0FFFFH
        B dw 1112H
        res dd ?
DATA ENDS
Code Segment
assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax
        mov ax,A
        mov bx,B
        mul BX
        lea si,res
        mov word ptr [si],ax
        inc si
        inc si
        mov word ptr [si],dx
        mov ah,4ch
        int 21h
        code ends
        end  start
