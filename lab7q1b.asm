Printstr macro msg
        lea dx,msg
        mov ah,09
        int 21h
endm
DATA SEGMENT
        A DW 0010H,0011H,1000H,1100H,1001H,0110H,1234H,4321H,1232H,0000H
        MSG1 DB "FOUND$"
        MSG2 DB "NOT FOUND$"
        B DW 1111H
DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
        START:
                MOV AX,DATA
                MOV DS,AX
                MOV CX,10
                LEA SI,A
                MOV AX,B
                BACK:
                        CMP AX,[SI]
                        JZ EXIT
                        INC SI
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
