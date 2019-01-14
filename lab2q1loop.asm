Data Segment
        Array1 dB 59h,7bh,0cdh,9ch,6ah
        Array2 dB ?,?,?,?,?
data ends
code segment
        assume cs:code,ds:data
        Start:
                mov ax,data
                mov ds,ax
                mov cx,5
                lea si,array1
                lea di,array2
                back:
                mov al,[si]
                mov [di],al
                inc si
                inc di
                loop back
                mov ah,4ch
                int 21h
         code ends
         end start


