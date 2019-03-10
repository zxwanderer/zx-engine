MODULE input

waitKey:
	xor a
	in a,(0xfe)
	cpl
	and 31
	jr z,waitKey
	ret

; waitGKey:
; 	HALT
; 	XOR A
; 	LD A,#FD
; 	IN A,(#FE)
; 	BIT 4,A
; 	RET Z
; 	JR waitGKey

noKey:
	xor a
	in a,(0xfe)
	cpl
	and 31
	jr nz,noKey
	ret

ENDMODULE