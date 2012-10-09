			;*****************************************************************************
			; File: algorithm.s
			; Programmer: Josh Gillham
			; Description: Generate a series of random numbers with randomnumber.s and put
			;  them into a string of words. Call a subroutine to count the 1s and another
			;  to count the 0s. Print the results to the console.
			;	
			;
			; Project: HW5
			; Date: 10-9-12
			;******************************************************************************

			AREA parse, CODE
SWI_WriteC		EQU 	&0			; Software interupt will write character in r0 to output
SWI_Exit		EQU	&11			; Software interupt will exit the program
seedpointer            	DCD     &55555555, &55555555
RANDOMSERIES        	DCD     &55555555, &55555555, &55555555, &00000000
			ALIGN
; Outline:
; 1. Store the results into a string of bytes.
; . While seedpointer is not zero.
; . Call RANDOM.S
; . Copy seedPointer to RANDOMSERIES
; . go back
; 2. For each byte count the 1s and 0s
; 3. Print the results to the screen.
			ENTRY
start
			ADR     r12, seedpointer
                     	LDR     r11, [r12], #4          ; r11=r12; r12+=4;
                       
                     	BL      randomnumber 
			SWI	SWI_Exit	; Exit the program

; Takes a byte and counts the number of 1s.
; 
; @arg r0 is the number to count
; 
; @return r2 is the count of 1s
;
; Outline:
; 1.  r2= 0
; 2. If( r0 == 0 ) return r2
; 3. Add 1 to r2
; 4. Let the temporary number (r1) = r0.
; 5. Subtract 1 from r0.
; 6. r0 = r1 AND r0.
; 7. Goto #1
;
count1sb
			MOV	pc, r14			; Return

; Takes a byte and counts the number of 0s.
; 
; @arg r0 is the in number to count
; 
; @return r2 is the count of 0s
;
; TODO:
; -finish outline.
; Outline:
; 1.  r2= 8
; 2. If( r0 == 255 ) return r2
; 3. Subtract 1 to r2
; 4. Let the temporary number (r1) = r0.
; 5. Add 1 from r0.
; 6. r0 = r1 OR r0.
; 7. Goto #1
;
count0sb
			MOV	pc, r14			; Return


