COMMENT &
Write an assembly program that reads from user a string of even number of characters, 
and then prints the same string but each two consecutive characters reversed.

Sample input 1:
Hello World!
Sample output 1:
eHll ooWlr!d

Sample input 2:
Assembly Language!
Sample output 2:
sAesbmylL naugga!e 

Note that maximum string length is 20.
&
;======================================================================================================
INCLUDE Irvine32.inc
.data
STR1 BYTE 20 DUP(?), 0
.code
	main PROC

		MOV EDX, OFFSET STR1
		MOV ECX, LENGTHOF STR1
		CALL READSTRING
		MOV ECX, EAX
		MOV ESI, OFFSET STR1
		CALL REVERSECHARACTERS
		MOV EDX, OFFSET STR1
		CALL WRITESTRING 
		CALL CRLF


		exit 

	main ENDP

	REVERSECHARACTERS PROC
		PUSHAD

		L1: 

			MOV AL, [ESI]
			XCHG AL, [ESI + 1]
			MOV [ESI], AL
			ADD ESI, 2

		LOOP L1


		POPAD
		RET
	REVERSECHARACTERS ENDP


END main