DATA SEGMENT
        A DW 1099H,1090H,1098H,1091H,1197H,1194H,1195H,1196H,1193H,1192H
DATA ENDS
CODE SEGMENT
	ASSUME CS:CODE,DS:DATA
START:
		MOV AX,DATA
		MOV DS,AX
	
		MOV SI,0
BACK2:          MOV CL,10
                MOV ch,00H
		DEC CX
		MOV BX,CX
                SUB CX,SI

		MOV DI,0
BACK:           MOV Ax,A[DI]
		CMP Ax,A[DI+2]
		JC SKIP
		XCHG Ax,A[DI+2]
		MOV A[DI],Ax
SKIP:           INC DI 
		inc di
		LOOP BACK
		
		INC SI
		CMP SI,BX
		JC BACK2

		MOV AH,4CH
		INT 21H
		
CODE ENDS
END START