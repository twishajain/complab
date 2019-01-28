Data Segment
        A dW 6001H
        B dW 0a001H
        res dD ?
DATA ENDS
Code Segment
assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax
        mov aX,A
        mov bX,B
        Imul BX
        LEA SI,RES
	MOV [SI],DX
	INC SI
	INC SI
	MOV [SI],AX
        mov ah,4ch
        int 21h
        code ends
        end  start
