DATA SEGMENT
MSG1 DB 'NOT PALLINDROME$'
MSG2 DB 'PALLINDROME$'
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
        MOV AH,0AH
        INT 21H
        MOV CL,LEN
        MOV CH,0
        LEA SI,STR
        LEA DI,STR
        ADD DI,CX
        DEC DI
        SHR CX,1

        BACK:
        CLD
        CMPSB
        JNZ DOWN
        DEC DI
        DEC DI
        LOOP BACK
        JMP DOWN1
        DOWN:
        DISP MSG1
        JMP EXIT1
        DOWN1:
        DISP MSG2
        EXIT1:
        MOV AH,4CH
        INT 21H
        CODE ENDS
        END START

