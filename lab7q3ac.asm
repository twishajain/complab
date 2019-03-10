DATA SEGMENT
        A DB 99H,98H,07H,06H,05H,94H,93H,92H,91H,00H
        DATA ENDS
        CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
        START:
        MOV AX,DATA
        MOV DS,AX
        MOV CX,9
        MOV BX,20H
        LEA SI,A
        BACK1:
        PUSH CX
        MOV AL,[SI]
        PUSH SI
        BACK:
        CMP AL,[SI+1]
        JL DOWN
        MOV AL,[SI+1]
        LEA BX,[SI+1]
        DOWN:
        INC SI
        LOOP BACK
        POP SI
        POP CX
        CMP BX,20H
        JZ EXITT
        MOV DL,[SI]
        MOV [BX],DL
        MOV [SI],AL
      
        MOV BX,20H
        EXITT:
        INC SI
        LOOP BACK1
        MOV AH,4CH
        INT 21H
        CODE ENDS
        END START
