    DEVICE ZXSPECTRUM128
    ; module tape
	
; tape loader
	
tStart	db 0,10
	dw t1len
t1beg	db 0xfd,0xb0		; clear val "
	db 0x22,"24575",0x22
	db ":"
	db 0xd9,0xc3,0xa7	; ink not pi
	db ":"
	db 0xda,0xc3,0xa7	; paper not pi
	db ":"
	db 0xe7,0xc3,0xa7	; border not pi
	db ":"
	db 0xfb			; cls
	db 0x0d
t1len	equ $-t1beg

	db 0,20
	dw t2len
t2beg	db 0xef			; load
	db 0x22,"game",0x22
	db 0xaf,0xb0		; code val
	db 0x22,"24576",0x22
	db ":"
	db 0xf9,0xc0,0xb0	; randomize usr val
	db 0x22,"24576",0x22
	db 0x0d
t2len	equ $-t2beg

	savebin "cell3326.bas",tStart,$-tStart