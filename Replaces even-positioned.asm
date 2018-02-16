; Replaces even-positioned characters in a large string with the characters of another string

INCLUDE Irvine32.inc

.DATA
str1 BYTE "Assembly is awesome!", 0
str2 BYTE 10 DUP(?), 0

.CODE
main PROC
	;Read small string from user
	mov edx, offset str2
	mov ecx, lengthof str2
	call readstring

	;Replace chars of the larger string
	mov esi, offset str1
	mov edi, offset str2
	mov ecx, lengthof str2 - 1	;because we don't want to include the termination character
	call replCharsWithStr

	;Write final output string
	mov edx, offset str1
	call writestring
	call crlf

	exit
main ENDP

;--------------------------------------------------------
;	Replaces even-positioned characters in a large string 
;	with the characters of another user-inputted string
;Recieves:	ESI = offset of str1 (large constant str)
;			EDI = offset of str2 (small input str)
;			ECX = num of chars in str2
;Returns:	Changes in the output array
;--------------------------------------------------------
replCharsWithStr PROC
	repl:
		mov al, [edi]
		mov [esi], al

		add esi, 2	;because we want only the even-positioned characters of the large str
		add edi, 1	
	LOOP repl

	ret
replCharsWithStr ENDP

END main