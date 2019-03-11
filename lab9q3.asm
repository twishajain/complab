DATA SEGMENT
        BUFFER DB 20
        LEN DB ?
        STR DB 20 DUP(?)
        BUFFER2 DB 10
        LEN2 DB ?
        STR2 DB 10 DUP(?)
        MSG1 DB 'ENTER MAIN STRING$'
        MSG2 DB 'ENTER SUBSTRING$'
        MSG3 DB 'FOUND$'
        MSG4 DB 'NOT FOUND$'
DATA ENDS
DISP MACRO MSG
        LEA DX,MSG
        MOV AH,09
        INT 21H
ENDM
LINE MACRO
        MOV DL,10
        MOV AH,02
        INT 21H
        MOV DL,13
        MOV AH,02
        INT 21H
        ENDM
CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
        START:
        MOV AX,DATA
        MOV DS,AX
        MOV ES,AX
        DISP MSG1
        LINE
        LEA DX,BUFFER
        MOV AH,0AH
        INT 21H
        LINE
        DISP MSG2
        LINE
        LEA DX,BUFFER2
        MOV AH,0AH
        INT 21H
        LINE
        
        MOV CL,LEN
        MOV CH,0
        
        LEA SI,STR
        BACK:
        
        LEA DI,STR2
        cld
        CMPSB
        JNZ NEXT
        push cx
        cmp len2,1
        jz exit
        MOV CL,LEN2
        MOV CH,0
        dec cx
        BACK2:
        CLD
        CMPSB
        JNZ NEXT2
        LOOP BACK2
        JMP EXIT
        next2:
        pop cx
        NEXT:
        LOOP BACK
        DISP MSG4
        JMP EXITT
        EXIT:
        DISP MSG3
        EXITT:
        MOV AH,4CH
        INT 21H
        CODE ENDS
        END START
