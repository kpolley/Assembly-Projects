; Input: Requests two integers from the user.
; Output: Outputs the sum of the input integers.

%include "macros_linux64.s"
.DATA
prompt_msg1 db "Please input the first number: ",0
prompt_msg2 db "Please input the second number: ",0
sum_msg db "The sum is ",0
diff_msg db "The diff is ", 0

.CODE
	.STARTUP
	PutStr prompt_msg1 		; request first number
	GetInt CX 				; CX = first number

	PutStr prompt_msg2 		; request second number
	GetInt DX 				; DX = second number

	call sum 				; returns sum in AX
	PutStr sum_msg 			; display sum
	PutInt AX
	nwln
	
	call diff
	PutStr diff_msg
	PutInt AX
	newln
	
done:
	.EXIT

 ;-----------------------------------------------------------
 ;Procedure sum receives two integers in CX and DX.
 ;The sum of the two integers is returned in AX.
 ;-----------------------------------------------------------
sum:
	mov AX,CX 				; sum = first number
	add AX,DX 				; sum = sum + second number
	ret
	
diff:
	mov AX, CX				; diff = first number
	sub AX, DX				; diff = diff - second number
	ret
	
