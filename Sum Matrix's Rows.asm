;Write an assembly program WITH PROCEDURE/S to print the sum of each row of a predefined 3X3 matrix.
;.data
;Arr DWORD 1, 2, 3, 4, 5, 6, 7, 8, 9
;Arr DWORD 10, 11, 12, 13, 14, 15, 16, 17, 18
;Sample output 1:
;6 15 24
;Sample output 2:
;33 42 54
;======================================================================================================
INCLUDE Irvine32.inc
.data
Arr1 DWORD 1, 2, 3, 4, 5, 6, 7, 8, 9
Arr2 DWORD 10, 11, 12, 13, 14, 15, 16, 17, 18, 19
.code
	main PROC

		;ESI HOLDS THE OFFSET OT THE FIRST ROW
		MOV ESI, OFFSET ARR1
		;EDI HOLDS THE OFFSET OF THE SECOND ROW
		MOV EDI, OFFSET ARR1
		ADD EDI, TYPE ARR1 * 3
		;EDX HOLDS THE OFFSET OF THE THIRD ROW
		MOV EDX, EDI
		ADD EDX, TYPE ARR1 * 3
		MOV ECX, 3
		;EBX HOLDS ARRAY TYPE 
		MOV EBX, TYPE ARR1
		CALL SUMROWS



		;ESI HOLDS THE OFFSET OT THE FIRST ROW
		MOV ESI, OFFSET ARR2
		;EDI HOLDS THE OFFSET OF THE SECOND ROW
		MOV EDI, OFFSET ARR2
		ADD EDI, TYPE ARR1 * 3
		;EDX HOLDS THE OFFSET OF THE THIRD ROW
		MOV EDX, EDI
		ADD EDX, TYPE ARR2 * 3
		MOV ECX, 3
		;EBX HOLDS ARRAY TYPE 
		MOV EBX, TYPE ARR2
		CALL SUMROWS
		


	    exit
	main ENDP


	SUMROWS PROC USES ESI EDI EDX ECX 

		;SUM OF THE FIRST ROW
		MOV EAX, 0
		PUSH ECX
		L1:
			
			ADD EAX, [ESI]
			ADD ESI, EBX

		LOOP L1
		CALL WRITEDEC
		CALL PRINTSPACE
		POP ECX
		;SUM OF THE SECOND ROW
		MOV EAX, 0
		PUSH ECX
		L2:
			
			ADD EAX, [EDI]
			ADD EDI, EBX

		LOOP L2
		
		CALL WRITEDEC
		CALL PRINTSPACE
		POP ECX
		PUSH ECX
		;SUM OF THE FIRST ROW
		MOV EAX, 0
		L3:
			
			ADD EAX, [EDX]
			ADD EDX, EBX

		LOOP L3
		POP ECX

		CALL WRITEDEC
		CALL PRINTSPACE
		CALL CRLF
		

		RET
	SUMROWS ENDP

	PRINTSPACE PROC
		PUSHAD

		MOV AL, ' '
		CALL WRITECHAR

		POPAD
		RET
	PRINTSPACE ENDP

	

END main