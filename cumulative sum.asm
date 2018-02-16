; Calculating the cumulative sum of 5 array elements

INCLUDE Irvine32.inc

.DATA
MAX_ARR_LEN equ 5
arr DWORD MAX_ARR_LEN dup(0)
res DWORD MAX_ARR_LEN dup(0)

.CODE
main PROC
	mov esi, offset arr
	mov ecx, MAX_ARR_LEN
	call readArr
	
	mov esi, offset arr
	mov edi, offset res
	mov ecx, MAX_ARR_LEN
	dec ecx
	call calCumSum

	mov esi, offset res
	mov ecx, MAX_ARR_LEN
	call displArr	

	exit
main ENDP

;--------------------------------------------------------
;	Calculates the cumulative sum of DWORD array elements
;	and places the output in an output array
;Recieves:	ESI = offset of input array
;			EDI = offset of output array
;			ECX = length of arrays (both are the same size)
;Returns:	Changes in the output array
;--------------------------------------------------------
calCumSum PROC
	; Place the first element
	mov eax, [esi]
	mov [edi], eax 
	add esi, type arr
	add edi, type res

	; Calculate the cumulative sum of the rest of the elements
	calc:
		mov eax, [esi]
		mov ebx, [edi-4]

		add eax, ebx
		mov [edi], eax
		
		add esi, type arr
		add edi, type res
	LOOP calc
	
	ret
calCumSum ENDP

;--------------------------------------------------------
;	Reads an input array
;Recieves:	ESI = offset of input array to read into
;			ECX = length of array
;Returns:	Changes in the input array
;--------------------------------------------------------
readArr PROC
	Lread:
		call readdec
		mov [esi], eax
		add esi, type arr
	LOOP Lread
	ret
readArr ENDP

;--------------------------------------------------------
;	Displays an output array
;Recieves:	ESI = offset of output array to write from
;			ECX = length of array
;--------------------------------------------------------
displArr PROC
	Lwrite:
		mov eax, [esi]
		call writedec
		call crlf
		add esi, type arr
	LOOP Lwrite
	ret
displArr ENDP

END main