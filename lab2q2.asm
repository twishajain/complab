data segment
        array1 db 59h,7bh,0cdh,9ch,6ah,11h,22h,33h,44h,55h
        array2 db 5 dup(?)
        data ends
code segment
        assume cs:code,ds:data
        start:
        mov ax,data
        mov ds,ax
        mov cx,10
        lea si,array1
        lea di,array2
        add si,9
        add di,4
        back:
        mov al,[si]
        mov [di],al
        dec si
        dec di
        loop back
       mov ah,4ch
       int 21h
       code ends
       end start
