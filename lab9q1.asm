DATA SEGMENT
        MSG1 DB 'PASSWORD'
        MSG2 DB 'MATCHED$'
        MSG3 DB 'NOTMATCHED$'
        BUFFER DB 20
        LEN DB ?
        STR DB 20 DUP(?)
DATA ENDS
DISP MACRO MSG
LEA DX,MSG
MOV AH,09
INT 21H
ENDM
CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
        START:
        MOV AX,DATA
        MOV DS,AX
        MOV ES,AX
        LEA DX,BUFFER
        MOV CX,8
        LEA BX,STR
        BACK1:
        MOV AH,08H
        INT 21H
        MOV [BX],AL
        INC BX
        MOV DL,'*'
        MOV AH,02
        INT 21H
        LOOP BACK1
        LEA SI,STR
        LEA DI,MSG1
        MOV CL,8
        MOV CH,0
        BACK:
        CMPSB
        JNZ EXIT
        LOOP BACK
        DISP MSG2
        JMP DONE
        EXIT:
        DISP MSG3
        DONE:
        MOV AH,4CH
        INT 21H
        CODE ENDS
        END START
