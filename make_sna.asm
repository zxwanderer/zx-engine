include "defines.asm"
include "core/defines.asm"

  ifdef _ShowStartupScreen_
ORG #4000
  incbin "./tiles.scr"
  endif

ORG PROG_ADDR

STATIC_BIN:
incbin "static.bin"
STATIC_BIN_END:

DYNAMIC_BIN:
incbin "dynamic.bin"
DYNAMIC_BIN_END:

DYNAMIC_BIN_PACK:
incbin "dynamic.bin.zx7"
DYNAMIC_BIN_PACK_END:

SAVESNA "cell3326.sna",PROG_ADDR

INT_VECTOR_h equ high INT_VECTOR
INT_VECTOR_h_1 equ INT_VECTOR_h + 1
INT_VECTOR_END equ INT_VECTOR + 257

INT_ROUTINE equ INT_VECTOR_h_1 * 256 + INT_VECTOR_h_1
INT_ROUTINE_END equ INT_ROUTINE + 3

display '-------- Snapshot ---------------------------------'
display 'STATIC_BIN:          ', STATIC_BIN, '-', STATIC_BIN_END-1, ', size: ', /D, STATIC_BIN_END-STATIC_BIN
display 'DYNAMIC_BIN:         ', DYNAMIC_BIN, '-', DYNAMIC_BIN_END-1, ', size: ', /D, DYNAMIC_BIN_END-DYNAMIC_BIN
display 'DYNAMIC_BIN_PACK:    ', DYNAMIC_BIN_PACK, '-', DYNAMIC_BIN_PACK_END-1, ', size: ', /D, DYNAMIC_BIN_PACK_END-DYNAMIC_BIN_PACK
display '[Free]               ', DYNAMIC_BIN_PACK_END, '-', INT_VECTOR-1,', size: ', /D, INT_VECTOR - DYNAMIC_BIN_PACK_END
display '---Interrupt---------------------------------------'
display 'VECTOR:              ', /H, INT_VECTOR_h
display 'POINTER:             ', /H, INT_VECTOR_h_1
display 'TABLE:               ', INT_VECTOR, '-', INT_VECTOR_END-1,', size: ', /D, INT_VECTOR_END - INT_VECTOR
display '[Free]               ', INT_VECTOR_END, '-', INT_ROUTINE-1,', size: ', /D, INT_ROUTINE - INT_VECTOR_END
display 'ROUTINE:             ', INT_ROUTINE, '-', INT_ROUTINE_END-1, ', size: ', /D, INT_ROUTINE_END - INT_ROUTINE
display '[Free]               ', INT_ROUTINE_END, '-', 0xFFFF,', size: ', /D, 0xFFFF - INT_ROUTINE_END
display '---------------------------------------------------'
