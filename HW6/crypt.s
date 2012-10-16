			;*****************************************************************************
			; File: crypt.s
			; Programmer: Josh Gillham
			; Description: This program takes a message and encrypts it then decrypts. Each
			;  step has printed output. The result is compared to the original for accuracy.
			;	
			;
			; Project: HW6
			; Date: 10-16-12
			;******************************************************************************

			AREA parse, CODE
			IMPORT printhexa
			IMPORT print_string
SWI_WriteC		EQU 	&0						; Software interupt will write character in r0 to output
SWI_Exit		EQU	&11						; Software interupt will exit the program
MSG			DCB	"This is a secret!",&0				; Store secret message
MSGOUT			DCB	"This the result!!",&0				; Store secret message
			ALIGN

			ENTRY
; Structure:
;  -The main subroutine calls in sequence the encryption subroutine,
;    the decryption subroutine and the compare subroutine
start

; Structure:
;  -Calls print_string to show the input then calls permutation and XOR_mask
encrypt

; Structure:
;  -Calls print_string to show the input then calls permutation and XOR_mask
decrypt

; Structure:
;  -Calls print_string to show the results. 
compare

; Structure:
;  -Calls print_string to show the result. 
permutation

; Structure:
;  -Calls print_string to show the result. 
XOR_mask

; Demostrates that I can save all the registers and restore them later. Only for testing purposes.
stack_test
			MOV r0, #1			; Store values
			MOV r1, #1			; Store values
			MOV r2, #1			; Store values
			MOV r3, #1			; Store values
			MOV r4, #1			; Store values
			MOV r5, #1			; Store values
			MOV r6, #1			; Store values
			MOV r7, #1			; Store values
			MOV r8, #1			; Store values
			MOV r9, #1			; Store values
			MOV r10, #1			; Store values
			MOV r11, #1			; Store values
			STMFD sp!, {r0-r14}		; Store all the registers
			MOV r0, #0			; Mess up the registers
			MOV r2, #5			; Mess up the registers
			MOV r3, #2			; Mess up the registers
			MOV r5, #3			; Mess up the registers
			MOV r8, #7			; Mess up the registers
			MOV r10, #9			; Mess up the registers
			LDMFD sp!, {r0-r14}		;Restore all the registers
			SWI	SWI_Exit					; Exit the program

			END
