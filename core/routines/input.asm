MODULE input

waitKey:
	xor a
	in a,(0xfe)
	cpl
	and 31
	jr z,waitKey
	ret

noKey:
	xor a
	in a,(0xfe)
	cpl
	and 31
	jr nz,noKey
	ret

ENDMODULE