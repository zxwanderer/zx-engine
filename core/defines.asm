PEN_BLACK equ 0
PEN_BLUE equ 1
PEN_RED equ 2
PEN_PURPLE equ 3
PEN_GREEN equ 4
PEN_CYAN equ 5
PEN_YELLOW equ 6
PEN_WHITE equ 7

_endByte equ 0

SCREEN_ADDR equ #4000
ATTR_ADDR EQU SCREEN_ADDR+#1800

MACRO mLDA
  LD A, (HL)
  INC HL
ENDM
