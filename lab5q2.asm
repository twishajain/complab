DATA SEGMENT
        HEX DB 0FFH
        BCD DB 2 DUP(?)
DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX
        MOV AL,HEX
        MOV AH,0
        MOV BL,0AH
        DIV BL
        MOV DL,AH
        MOV AH,0
        DIV BL
        MOV CL,04
        SHL AH,CL
        ADD AH,DL
        MOV BCD,AH
        MOV BCD+1,AL
        MOV AH,4CH
        INT 21H
CODE ENDS
END START
