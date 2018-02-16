; Multiplies elements of one array with the reversed elements of another array, and stores and displays the products in a new array.

INCLUDE Irvine32.inc

.DATA
arr1 DWORD 1, 2, 3, 4, 5
arr2 DWORD 10, 9, 8, 7, 6
res DWORD 5 dup(0)

.CODE
main PROC
	;Multiply the 2 arrays as requested
	mov esi, offset arr1
	mov edi, offset arr2 + sizeof arr2 - type arr2	;Draw this on paper. You'll get it :)
													;(Remember that the array is of type DWORD, so adding "lengthof arr2"
													; to move EDI to the last element of the array won't work correctly)
	mov edx, offset res
	mov ecx, lengthof res							;Or arr1 or arr2. All are the same size.
	call multArray
	
	;Print the resulting array
	mov esi, offset res
	mov ecx, lengthof res
	call displArr

	exit
main ENDP

;--------------------------------------------------------
;	Multiplies elements of one array with the reversed
;	elements of another array. (All DWORD arrays.)
;Recieves:	ESI = offset of first array
;			EDI = offset of the end of the second array (ie. EDI points to the last num in the second array)
;			EDX = offset of the empty result array
;			ECX = length of result array
;Returns:	Changes in the result array
;--------------------------------------------------------
multArray PROC
	LArr:
		mov eax, [esi]
		mov ebx, [edi]

		push ecx
		push edx
		
		call multTwoNums
		
		pop edx
		pop ecx

		mov [edx], eax

		add esi, 4
		sub edi, 4
		add edx, 4
	LOOP LArr
ret
multArray ENDP

;--------------------------------------------------------
;	Multiplies 2 numbers.
;Recieves:	EAX = num to multiply
;			EBX = how many times to multiply EAX
;Returns:	EAX = resulting product
;--------------------------------------------------------
multTwoNums PROC
	mov edx, eax
	mov ecx, ebx
	dec ecx
	LMul:
		add eax, edx
	LOOP LMul

	ret
multTwoNums ENDP

;--------------------------------------------------------
;	Displays a result DWORD array
;Recieves:	ESI = offset of output array to write from
;			ECX = length of array
;--------------------------------------------------------
displArr PROC
	Ldispl:
		mov eax, [esi]
		call writedec
		call crlf
		add esi, 4
	LOOP Ldispl
	ret
displArr ENDP

END main