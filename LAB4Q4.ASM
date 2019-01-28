Data Segment
        A dW 6000H
        B db 0a0H
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
        div BL
        MOV QUO,AL
        MOV REM,AH
        mov ah,4ch
        int 21h
        code ends
        end  start
