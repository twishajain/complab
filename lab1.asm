code segment
        assume cs:code
        start:
                mov al,7bh
                mov bl,al
                mov cx,0a912h
                mov dx,cx
                mov ah,4ch
                int 21h
        code ends
        end start
