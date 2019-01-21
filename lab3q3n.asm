data segment
        num1 dd 92154376h
        num2 dd 15943710h
        sum dd ?
        carry db ?
        data ends
        code segment
        assume cs:code,ds:data
        start:
        mov ax,data
        mov ds,ax
        lea si,num1
        lea di,num2
        lea bx,sum
        mov cx,4
        clc
        back:
        mov al,[si]
        adc al,[di]
        daa
        mov [bx],al
        inc si
        inc di
        inc bx
        loop back
        adc carry,0
        mov ah,4ch
        int 21h
        code ends
        end start

