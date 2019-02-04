DATA SEGMENT
        BCD DW 1234H
        HEX DW ?
DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX
        MOV AX,BCD
        MOV CL,8
        SHR AX,CL
        CALL CALC
        MOV BX,AX
        MOV AX,BCD
        AND AX,00FFH
        CALL CALC
        XCHG AX,BX
        MOV CL,100
        MUL CL
        ADD AX,BX
        MOV HEX,AX
        MOV AH,4CH
        INT 21H
CALC PROC
        MOV DX,AX
        AND DX,000FH
        AND AX,00F0H
        MOV CL,4
        SHR AX,CL
        MOV CL,10
        MUL CL
        ADD AX,DX
        RET
        CALC ENDP
CODE ENDS
END START
