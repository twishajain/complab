DATA SEGMENT
        A DW 1099H,1098H,1097H,1096H,1195H,1194H,1193H,1192H,1191H,1190H
        DATA ENDS
        CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
        START:
        MOV AX,DATA
        MOV DS,AX
        MOV CX,9
        MOV BX,2000H
        LEA SI,A
        BACK1:
        PUSH CX
        MOV AX,WORD PTR [SI]
        PUSH SI
        BACK:
        CMP AX,WORD PTR [SI+2]
        JC DOWN
        MOV AX,[SI+2]
        LEA BX,[SI+2]
        DOWN:
        INC SI
	INC SI
        LOOP BACK
        POP SI
        POP CX
        CMP BX,2000H
        JZ EXITT
        MOV DX,WORD PTR [SI]
        MOV [BX],DX
        MOV [SI],AX
        MOV BX,2000H
        EXITT:
        INC SI
        INC SI
        LOOP BACK1
        MOV AH,4CH
        INT 21H
        CODE ENDS
        END START
