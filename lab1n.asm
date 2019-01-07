data segment
        num1 dw 0b411h
        num2 dw ?
data ends
code segment
        assume cs:code, ds:data
        start:
        mov ax,data
        mov ds,ax
        mov ax,num1
        mov num2,ax
        mov ah,4ch
        int 21h
code ends
end
