Data Segment
        A dW 1234H
        B db 0F5H
        QUO DB ?
        REM DB ?
DATA ENDS
Code Segment
assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax
        mov aX,A
        mov bl,B
        Idiv BL
        MOV QUO,AL
        MOV REM,AH
        mov ah,4ch
        int 21h
        code ends
        end  start
