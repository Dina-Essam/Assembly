COMMENT &
Write an assembly program with PROCEDURE/S that reads a string and a number from user.
You are required to print the characters of the string in the triangle shape.

Sample Input 1:
ABCDEFGHIJ
4

Sample output 1:

ABCD
EFG
HI
J

Sample input 2:

Hello!
3

Sample output 2:

Hel
lo
!

&
;======================================================================================================
INCLUDE Irvine32.inc
.data
Str1 BYTE 20 DUP(?), 0
.code
	main PROC

		MOV EDX, OFFSET STR1
		MOV ECX, LENGTHOF STR1
		CALL READSTRING
	
		
		CALL READDEC
		MOV ECX, EAX
		
		CALL PRINTTRIANGLE
		


	    exit
	main ENDP


	PRINTTRIANGLE PROC
		PUSHAD
		
		L1: 
			
			PUSH ECX
			L2:
			
				MOV AL, [EDX]
				CALL WRITECHAR
				INC EDX
				
			LOOP L2
			POP ECX
			CALL CRLF
		
		
		LOOP L1
	
		POPAD
		RET
	PRINTTRIANGLE ENDP

END main