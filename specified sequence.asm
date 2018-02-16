; Generates a specified sequence, where each element = the previous element x 10.

INCLUDE Irvine32.inc

.DATA
seq DWORD 20 dup(0)
startNum DWORD ?
seqSize DWORD ?

.CODE
main PROC
	;Read the first number of the sequence
	call readdec
	mov startNum, eax
	
	;Read the sequence size
	call readdec
	mov seqSize, eax

	;Find the sequence
	mov esi, offset seq
	mov ecx, seqSize
	dec ecx		;because we will set the 1st element (ONLY) manually, and the rest are generated
	call findSeq

	;Print the sequence
	mov esi, offset seq
	mov ecx, seqSize
	call displSeq

	exit
main ENDP

;--------------------------------------------------------
;	Generates a sequence of DWORD numbers, where each  
;	element = the previous element x 10.
;Recieves:	ESI = offset of array to store generated sequence in
;			ECX = sequence size
;			startNum = first number in the sequence
;Returns:	Changes in the sequence array
;--------------------------------------------------------
findSeq PROC
	;Place first element in the sequence
	mov eax, startNum
	mov [esi], eax 

	;Generate the rest of the sequence
	LgenSeq:
		push ecx
		
		mov eax, 0
		mov ecx, 10
		mulTen:
			add eax, [esi]
		LOOP mulTen

		add esi, 4
		mov [esi], eax

		pop ecx
	LOOP LgenSeq

	ret
findSeq ENDP

;--------------------------------------------------------
;	Displays an output DWORD array
;Recieves:	ESI = offset of output array to write from
;			ECX = length of array
;--------------------------------------------------------
displSeq PROC
	Ldispl:
		mov eax, [esi]
		call writedec
		call crlf
		add esi, 4
	LOOP Ldispl
	ret
displSeq ENDP

END main