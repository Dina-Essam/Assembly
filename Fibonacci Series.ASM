;Write a PROCEDURE that prints the Fibonacci series on the screen STRTING WITH ZERO at given index read from user.
;The Fibonacci numbers are the numbers in the following integer sequence, called the Fibonacci sequence, and characterized by 
;the fact that every number after the first two is the sum of the two preceding ones as in the following:
; 
;Sample input 1:
;5
;Sample output 1:
;0 1 1 2 3 5
;
;Sample input 1:
;0 1 1 2 3 5 8 13 21 34 55 

INCLUDE Irvine32.inc
.data

.code
	main PROC

		CALL READDEC
		CALL FIB

		exit
	main ENDP

	Fib PROC

		MOV ECX, EAX
		MOV EAX, 0
		CALL WRITEDEC
		CALL PRINTSPACE

		MOV EBX, 1
		MOV EAX, 0


		L1:
	
			ADD EAX, EBX
			CALL WRITEDEC
			CALL PRINTSPACE
			XCHG EBX, EAX

		LOOP L1
		CALL CRLF

		RET

	Fib ENDP

	PRINTSPACE PROC
		PUSHAD

		MOV AL, ' '
		CALL WRITECHAR

		POPAD
		RET
	PRINTSPACE ENDP

	END main