; Print an alphabetic right-angle triangle

INCLUDE Irvine32.inc

.DATA

.CODE
main PROC
	call readdec

	mov ecx, eax
	call printAlpTri

	exit
main ENDP

;--------------------------------------------------------
;	Prints a right-angle triangle on the console,
;	with increasing alphabetic characters
;Recieves:	ECX = number of rows of the triangle to draw
;--------------------------------------------------------
printAlpTri PROC
	mov ebx, 1
	mov dl, 'A'
	
	outer:
		push ecx

		mov ecx, ebx
		inner:
			mov al, dl
			call writechar

			mov al, ' '
			call writechar

			inc dl
		LOOP inner
		inc ebx

		call crlf
		pop ecx
	LOOP outer

	ret
printAlpTri ENDP

END main