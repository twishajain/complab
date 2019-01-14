data segment
        array1 dw 5911h,7b22h,0cd33h,9c44h,6a55h
        array2 dw 5 dup(?)
        data ends
code segment
        assume cs:code,ds:data
        start:
        mov ax,data
        mov ds,ax
        mov cx,5
        lea si,array1
        lea di,array2
        back:
        mov ax,[si]
        mov [di],ax
        inc si
        inc di
        inc si
        inc di
        loop back
       mov ah,4ch
       int 21h
       code ends
       end start
