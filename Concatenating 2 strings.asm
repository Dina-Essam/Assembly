; Concatenating 2 strings into 1 string, separated by a space, with second string reversed

INCLUDE Irvine32.inc

.DATA
str1 BYTE 5 DUP(?), 0
str2 BYTE 5 DUP(?), 0
cStr BYTE 10 DUP(?), 0

str1_len DWORD ?
str2_len DWORD ?

.CODE
main PROC
	; Read first string
	mov edx, offset str1
	mov ecx, lengthof str1
	call readstring
	mov str1_len, eax

	; Read second string
	mov edx, offset str2
	mov ecx, lengthof str2
	call readstring
	mov str2_len, eax

	; Concatenate strings (with second reversed)
	mov esi, offset str1
	mov edi, offset str2
	mov edx, offset cStr
	call concStrs

	; Print final string
	mov edx, offset cStr
	call writestring
	call crlf

	exit
main ENDP

;--------------------------------------------------------
;	Concatenates 2 strings into 1 string, separated 
;	by a space, with second string reversed
;Recieves:	ESI = offset of str1
;			EDI = offset of str2
;			EDX = offset of cStr (output string)
;			str1_len = length of str1
;			str2_len = length of str2
;Returns:	Changes in the cStr array
;--------------------------------------------------------
concStrs PROC
	; Put first string in cStr 
	mov ecx, str1_len
	L1:
		mov al, [esi]
		mov [edx], al

		inc esi
		inc edx
	LOOP L1

	; Put space after first string in cStr
	mov byte ptr [edx], ' '

	; Put second string reversed in cStr 
	add edx, str2_len
	mov ecx, str2_len
	L2:
		mov al, [edi]
		mov [edx], al

		inc edi
		dec edx
	LOOP L2

	ret
concStrs ENDP

END main