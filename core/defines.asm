PEN_BLACK     equ %000
PEN_BLUE      equ %001
PEN_RED       equ %010
PEN_PURPLE    equ %011
PEN_GREEN     equ %100
PEN_CYAN      equ %101
PEN_YELLOW    equ %110
PEN_WHITE     equ %111

PAPER_BLACK   equ %000000
PAPER_BLUE    equ %001000
PAPER_RED     equ %010000
PAPER_PURPLE  equ %011000
PAPER_GREEN   equ %100000
PAPER_CYAN    equ %101000
PAPER_YELLOW  equ %110000
PAPER_WHITE   equ %111000


;указатели направления
dir_up   EQU 0
dir_up_right EQU 1
dir_right  EQU 2
dir_down_right EQU 3
dir_down EQU 4
dir_down_left EQU 5
dir_left  EQU 6
dir_up_left EQU 7

_endByte equ 0

scrHeight equ 12
scrWidth equ 16
mapSize equ 32

SCREEN_ADDR equ #4000
ATTR_ADDR EQU SCREEN_ADDR+#1800

STRUCT Point
y db 0
x db 0
ENDS

MACRO mLDA
  LD A, (HL)
  INC HL
ENDM

MACRO mLDB
  LD B, (HL)
  INC HL
ENDM

MACRO mLDE ;LD DE, (HL)
  LD E, (HL)
  INC HL
  LD D, (HL)
  INC HL
ENDM

MACRO mLBC ;LD BC, (HL)
  LD C, (HL)
  INC HL
  LD B, (HL)
  INC HL
ENDM

MACRO mADDA hr,lr ; прибавляем A к регистровой паре hrlr
	add a,lr;  a = a + lr
	ld lr,a ; lr = a + lr
	adc a,hr ; a = a + lr + hr + (carry )
	sub lr; a = a + hr
	ld hr,a
ENDM
