Printstr macro msg
        lea dx,msg
        mov ah,09
        int 21h
endm
DATA SEGMENT
        A DB 99H,98H,95H,97H,96H,94H,92H,93H,91H,90H
        MSG1 DB "FOUND$"
        MSG2 DB "NOT FOUND$"
        B DB 05H
DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
        START:
                MOV AX,DATA
                MOV DS,AX
                MOV CX,10
                LEA SI,A
                MOV AL,B
                BACK:
                        CMP AL,[SI]
                        JZ EXIT
                        INC SI
                        LOOP BACK
                        DOWN:
                        PRINTSTR MSG2
                        JMP DONE
                        EXIT:
                        PRINTSTR MSG1
                        DONE:
                        MOV AH,4CH
                        INT 21H
                        CODE ENDS
                        END START
