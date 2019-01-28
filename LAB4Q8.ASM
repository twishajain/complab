DATA SEGMENT
        NUM1 DW 0FFFFH
        NUM2 DW 0005H
        RES DD ?
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:

        MOV AX,DATA
        MOV DS,AX
        CLC
        MOV CX,NUM2
        MOV AX,0000H
        BACK:
        ADD AX,NUM1
        ADC DX,0
        LOOP BACK
        LEA SI,RES
        MOV WORD PTR [SI],AX
        INC SI
        INC SI
        MOV WORD PTR [SI],DX
        MOV AH,4CH
        INT 21H
        CODE ENDS
        END START
                
