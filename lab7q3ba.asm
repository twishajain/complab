`DATA SEGMENT
    A DB 11H,9H,10H,19H,12H
DATA ENDS

CODE SEGMENT 
    ASSUME CS:CODE,DS:DATA
START:
    MOV AX,DATA
    MOV DS,AX

    MOV DX,4

    OUTER:
        LEA SI,A
        MOV CX,DX

        INNER:
            MOV AL,BYTE PTR[SI]
            CMP AL,BYTE PTR[SI+1]
            JC CONTINUE
            XCHG AL,BYTE PTR[SI+1]
            MOV BYTE PTR[SI],AL

            CONTINUE:
                INC SI
                LOOP INNER
        DEC DX
        JNZ OUTER 

        MOV AH,4CH
        INT 21H
CODE ENDS
END START
