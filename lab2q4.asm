Data segment
        a1 db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        a2 db 11h,22h,33h,44h,55h,66h,77h,88h,99h,0aah
        data ends
        code segment
        assume cs:code,ds:data
        start:
        mov ax,data
        mov ds,ax
        lea si,a1
        lea di,a2
        mov cx,10
        back:
        mov ax,[si]
        xchg [di],ax
        xchg ax,[si]
        inc si
        inc di
        loop back
        mov ah,4ch
        int 21h
        code ends
        end start
