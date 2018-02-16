COMMENT &
Write an assembly program WITH PROCEDURE/S that reads 2 strings from user, add them together then display the resulting string again.
Sample input 1:
Hello World!
Assembly hi!
Sample output 1:
ë+¯-_épFÆ+-B
Sample input 2:
ABCDEFG HIJKLMNOP
QRSTUV WX YZ abcd
Sample output 2:
ÆöûÿÜ£gwáiúÑl«¦¦¦
&
;======================================================================================================
INCLUDE Irvine32.inc
.data
Str1 BYTE 20 DUP(?), 0
Str2 BYTE 20 DUP(?), 0

.code
	main PROC

		MOV EDX, OFFSET STR1
		MOV ECX, LENGTHOF STR1
		CALL READSTRING

		MOV EDX, OFFSET STR2
		MOV ECX, LENGTHOF STR2
		CALL READSTRING

		MOV ESI, OFFSET STR1
		MOV EDI, OFFSET STR2
		CALL ADDSTRINGSCHARACTERS

	    exit
	main ENDP

	ADDSTRINGSCHARACTERS PROC
		PUSHAD

		L1: 

			MOV AL, [ESI]
			ADD AL, [EDI]
			CALL WRITECHAR
			INC ESI
			INC EDI

		LOOP L1
		CALL CRLF

		POPAD
		RET
	ADDSTRINGSCHARACTERS ENDP

END main