Data Segment
        A dB 60H
        B dB 0a0H
        res dW ?
DATA ENDS
Code Segment
assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax
        mov aL,A
        mov bL,B
        Imul BL
        MOV RES,AX
        mov ah,4ch
        int 21h
        code ends
        end  start
