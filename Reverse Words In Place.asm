;Write an assembly program with PROCEDURE/S to reverse a predefined strings' words in place.
;Str1 byte "ABCD EFGH IJKL", 0
;Str2 byte "MNOP QRST UVWX", 0
;•	You have two strings with three words each separated by SPACE.
;•	Each word contains FOUR CHARACTERS only. 
;•	Use stack to solve this question.
;
;Sample output 1:
;DCBA HGFE LKJI
;Sample output 2:
;PONM TSRQ XWVU 
;======================================================================================================
INCLUDE Irvine32.inc
.data
Str1 byte "ABCD EFGH IJKL", 0
Str2 byte "MNOP QRST UVWX", 0
.code
	main PROC

		MOV EDX, OFFSET STR1
		;EBX HOLDS THE LENGTH OF EACH WORD
		MOV EBX, 4
		;ECX HOLDS NUMBER OF WORDS IN THE STRING
		MOV ECX, 3
		CALL REVERSEINPLACE

		MOV EDX, OFFSET STR2
		;EBX HOLDS THE LENGTH OF EACH WORD
		MOV EBX, 4
		;ECX HOLDS NUMBER OF WORDS IN THE STRING
		MOV ECX, 3
		CALL REVERSEINPLACE


		exit 

	main ENDP

	REVERSEINPLACE PROC
		PUSHAD

		L1:

			PUSH ECX
			MOV ECX, EBX
			L2:
				
				MOVZX EAX,BYTE PTR [EDX]
				PUSH EAX
				INC EDX
				
			LOOP L2
			INC EDX

			MOV ECX, EBX
			L3: 

				POP EAX
				CALL WRITECHAR

			LOOP L3
		    CALL PRINTSPACE

			POP ECX
			
		LOOP L1

		CALL CRLF
		POPAD
		RET
	REVERSEINPLACE ENDP

	PRINTSPACE PROC
		PUSHAD

		MOV AL, ' '
		CALL WRITECHAR

		POPAD
		RET
	PRINTSPACE ENDP

	

END main