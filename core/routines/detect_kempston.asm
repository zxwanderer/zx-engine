; https://zx-pk.ru/threads/29936-lovecraft-mythos.html?p=995034&viewfull=1#post995034
; autodetect kempston from dizzy4
	LD   BC,#5000
L5E9B:	IN   A,(#1F)
	OR   C
	LD   C,A
	EI
	HALT
	DI
	DJNZ L5E9B
	LD   A,C
	AND  #E0
	LD   A,#FF ; enable
	JR   Z,L5EAC
	XOR  A
L5EAC:	LD   (#728F),A
	EI