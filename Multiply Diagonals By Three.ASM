COMMENT &
Write an assembly program WITH PROCEDURE/S that reads a 3X3 DWORD array from user then multiplies the two diagonals of the 
matrix by THREE then prints the array again.
     
Sample Input:
1 2 3 4 5 6 7 8 9
Sample output:
3 2 9 4 15 6 21 8 27

&
;======================================================================================================
INCLUDE Irvine32.inc
.data
ARR1 DWORD 3 DUP(?, ?, ?)
.code
	main PROC
		

		MOV ESI, OFFSET ARR1
		MOV ECX, LENGTHOF ARR1
		CALL READARRAY
		MOV ECX, LENGTHOF ARR1 / 3
		CALL MULTIPLYDIAGONALS
		MOV ECX, LENGTHOF ARR1
		CALL PRINTARRAY


		exit 

	main ENDP

	MULTIPLYDIAGONALS PROC
		PUSHAD

		MOV EAX, 0
		MOV EBX, 0

		PUSH ECX
		PUSH ESI

		;1ST DIAGONAL
		L1: 

			MOV EBX, [ESI]
			ADD EAX, EBX
			ADD EAX, EBX
			ADD EAX, EBX


			MOV [ESI], EAX
			MOV EAX, 0
			ADD ESI, 16

		LOOP L1

		POP ESI
		POP ECX

		;MOVE THE POINTER TO THE NEXT DIAGONAL
		ADD ESI, 8
		DEC ECX
		;2ND DIAGONAL
		L2: 

			MOV EBX, [ESI]
			ADD EAX, EBX
			ADD EAX, EBX
			ADD EAX, EBX

			MOV [ESI], EAX
			MOV EAX, 0
			ADD ESI, 16

		LOOP L2



		POPAD
		RET
	MULTIPLYDIAGONALS ENDP

	READARRAY PROC
		PUSHAD
			
			L1: 

				CALL READDEC
				MOV [ESI], EAX
				ADD ESI, 4

			LOOP L1


		POPAD
		RET

	READARRAY ENDP

	PRINTARRAY PROC
		PUSHAD

		L1: 

			MOV EAX, [ESI]
			CALL WRITEDEC
			CALL PRINTSPACE
			ADD ESI, 4

		LOOP L1

		POPAD
		RET
	PRINTARRAY ENDP

	PRINTSPACE PROC
		PUSHAD

		MOV AL, ' '
		CALL WRITECHAR

		POPAD
		RET
	PRINTSPACE ENDP


END main