Data Segment
        A dd 12345678H
        B dw 0FFFFH
        QUO DW ?
        REM DW ?
DATA ENDS
Code Segment
assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax
        LEA SI,A
        mov AX,WORD PTR [SI]
        INC SI
        INC SI
        MOV DX,WORD PTR [SI]
        mov BX,B
        div BX
        MOV QUO,AX
        MOV REM,DX
        mov ah,4ch
        int 21h
        code ends
        end  start
