DATA SEGMENT
        HEX DW 0FFFFH
        BCD DB 3 DUP(?)
        TEMP DB 4 DUP(?)
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
        START:
        MOV AX,DATA
        MOV DS,AX
        MOV AX,HEX
        MOV DX,0000H
        MOV BX,000AH
        MOV CX,4
        LEA SI,TEMP+3
        BACK:
                DIV BX
                MOV [SI],DL
                DEC SI
                MOV DX,0000H
                LOOP BACK
        MOV BX,0000H
        MOV BH,TEMP
        MOV CL,4
        SHL BH,CL
        ADD BH,TEMP+1
        MOV BL,TEMP+2
        MOV CL,4
        SHL BL,CL
        ADD BL,TEMP+3
        MOV BCD,BL
        MOV BCD+1,BH
        MOV BCD+2,AL
        MOV AH,4CH
        INT 21H
        CODE ENDS
        END START


