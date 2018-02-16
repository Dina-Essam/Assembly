
;دينا_عصام_محمد
;################Q1################
include irvine32.inc
.data

	numElem EQU 9
	Arr DWORD numElem dup (?)
	
.code
main proc

	; Read array elements
	MOV ESI, OFFSET Arr
	MOV ECX, numElem
	readA:
		CALL readint
		MOV [ESI], EAX
		ADD ESI, 4
	LOOP readA 

	;ADD diagonal in EDX
	MOV ESI, OFFSET Arr
	MOV ECX,3
	MOV EDX,0
	result:
		ADD EDX,[ESI]
		ADD ESI,16
	LOOP result
	
	;write result
	MOV EAX,EDX
    CALL WriteINT

	exit
main endp
end main
;
;
;################Q2################
include irvine32.inc
.data

	count DWORD ?
	
.code
main proc

	call readint
	mov ecx,eax
	mov count,1
	mov edx,0
	L1:
	ADD EDX,count
	MOV EAX,EDX
	ADD count,1
	call writeint
	MOV AL,' '
	call writechar
	LOOP L1

	exit
main endp

end main
;
;
;;################Q3################
include irvine32.inc
.data

	numElem EQU 9
	Arr1 BYTE numElem dup (?)
	Arr2 BYTE numElem dup (?)

.code
main proc


	MOV ESI, OFFSET Arr1
	MOV ECX, numElem
	readA:
		CALL readint
		MOV [ESI], EAX
		ADD ESI, 1
	LOOP readA 



	MOV ESI, OFFSET Arr1
	MOV EDI, OFFSET Arr2
	MOV ECX,3
	L1:
		
		MOV EDX,ECX
		MOV ECX,3
		L2:

			MOV al,[ESI]
			MOV [EDI],al
			CALL writeint
			call crlf
			ADD EDI,1
			ADD ESI,3

		LOOP L2
		MOV ECX,EDX
		SUB ESI,8
	LOOP L1



	exit
main endp

end main
;
;;################Q4################
include irvine32.inc
.data

	num BYTE ?
	count BYTE ?
	count2 BYTE ?

.code
main proc

	CALL READINT
	MOV num,al
	MOV count,al
	DEC count
	MOV count2,1
	MOVZX ECX,count
	L1:

		PUSH ECX
		MOVZX ECX,count
		MOV AL,' '
		L2:
			call writechar
		LOOP L2
		DEC count


		MOVzx ECX,count2
		MOV AL,'*'
		L3:
			call writechar
		LOOP L3
		
		ADD count2,2
		call crlf
		POP ECX
	LOOP L1


	MOVZX ECX,count2
	MOV AL,'*'
	L4:
		call writechar
	LOOP L4
	call crlf

	ADD count,1
	SUB count2,2
	SUB num,1
	MOVzx ECX,num
	L5:
		push ecx
		MOVZX ECX,count
		MOV AL,' '
		L6:
			call writechar
		LOOP L6
		add count,1


		MOVzx ECX,count2
		MOV AL,'*'
		L7:
			call writechar
		LOOP L7
		sub count2,2
		call crlf
		pop ecx
	LOOP L5

	exit
main endp

end main
;
;;################Q5################
include irvine32.inc
.data
	
	num DWORD ?
	
.code
main proc

	call readint
	MOV num,eax

	MOV ECX,8
	L1:
		CALL WRITEINT
		ADD EAX,NUM
		PUSH EAX
		MOV AL,','
		CALL WRITECHAR
		POP EAX
	LOOP L1
	CALL WRITEINT
	CALL CRLF

	exit
main endp

end main
;
;;################Q6################
INCLUDE Irvine32.inc

.data
binaryStr BYTE 32 DUP(?), 0
numBits DWORD ?
decVal DWORD ?

.code
main PROC
	; Read binary string
	MOV edx, offset binaryStr
	MOV ecx, lengthof binaryStr+1 ; +1 to make space for a termination char
	CALL readstring
	MOV numBits, eax

	; Make ESI point to end of the input binary string
	MOV esi, offset binaryStr
	ADD esi, numBits
	DEC esi
	
	MOV eax, 0		;=sum

	CALL binToDec

	; Write output decimal value to console
	MOV decVal, eax
	CALL writedec
	CALL crlf

	exit
main ENDP
binToDec PROC
	; Evaluate and add first bit (bit 0)
	MOVZX edx, byte ptr[esi]
	SUB edx, 30h	; converting the char to decimal
	ADD eax, edx	; 2^0 done
	DEC esi			; so decrement 1

	MOV ebx, 1		;index of current element, ie. start from index 1
	
	MOV ecx, numBits	
	DEC ecx			; because we already added bit at index=0
	L1:
		PUSH ecx

		; -------- Find 2^index --------
		MOV edx, 1		; = 2^index
		MOV ecx, ebx	; ebx = index
		find2PowInd:
			ADD edx, edx
		LOOP find2PowInd
		INC ebx

		; -------- Mul 2^index with bit 0/1 --------
		MOVZX edi, byte ptr[esi]	; get char
		SUB edi, 30h	; converting the char to decimal
	
		MOV ecx, edx	; edx = 2^index
		calcValAtIndex:
			ADD eax, edi 
		LOOP calcValAtIndex

		DEC esi
		POP ecx
	LOOP L1

	ret
binToDec ENDP

END main
;;################Q7################
include irvine32.inc
.data

	numElem EQU 20
	Arr1 BYTE numElem dup (?)
	n1 dword ?
	Arr2 WORD numElem dup (?)
	n2 dword ?
	CON DWORD 40 dup(?)
	prompt1 BYTE "Elements of Array1: ",0
    prompt2 BYTE "Elements of Array2: ",0
	prompt3 BYTE "Input Array1: ",0
    prompt4 BYTE "Input Array2: ",0
	prompt5 BYTE "Concatenated array: ",0
	
.code
main proc

	MOV EDX, OFFSET prompt1
	call writeString
	call readint
	MOV n1,eax
	MOV EDX, OFFSET prompt3
	call writeString
	MOV ESI, OFFSET Arr1
	MOV ECX,n1
	L1:
		call readint
		MOV [ESI],al
		ADD ESI,1
	Loop L1



	MOV EDX, OFFSET prompt2
	call writeString
	call readint
	MOV n2,eax
	MOV EDX, OFFSET prompt4
	call writeString
	MOV ESI, OFFSET Arr2
	MOV ECX,n2
	L2:
		call readint
		MOV [ESI],al
		ADD ESI,2
	Loop L2


	MOV ESI, OFFSET CON
	MOV EAX, OFFSET Arr1
	MOV ECX,n1
	L3:
		MOV BL,[EAX]
		MOV [ESI],BL
		ADD ESI,4
		ADD EAX,1
	LOOP L3

	
	MOV EAX, OFFSET Arr2
	MOV ECX,n2
	L4:
		MOV BX,[EAX]
		MOV [ESI],BX
		ADD ESI,4
		ADD EAX,2
	LOOP L4

	MOV EDX, OFFSET prompt5
	call writeString

	MOV ESI, OFFSET CON
	MOV EBX,n2
	ADD n1,EBX
	MOV ECX,n1
	L5:
		MOV EAX,[ESI]
		CALL WRITEINT
		MOV AL,' '
		CALL WRITECHAR
		ADD ESI,4
	LOOP L5
	CALL CRLF

	exit
main endp

end main