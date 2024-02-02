include "defines.asm"
include "core/defines.asm"
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

INT_VECTOR_high equ (high INT_VECTOR)
INT_VECTOR_high_1 equ (high INT_VECTOR) + 1

display '-------- Snapshot ---------------------------------'
display 'STATIC_BIN:          ', STATIC_BIN, '-', STATIC_BIN_END-1, ', size: ', /D, STATIC_BIN_END-STATIC_BIN
display 'DYNAMIC_BIN:         ', DYNAMIC_BIN, '-', DYNAMIC_BIN_END-1, ', size: ', /D, DYNAMIC_BIN_END-DYNAMIC_BIN
display 'DYNAMIC_BIN_PACK:    ', DYNAMIC_BIN_PACK, '-', DYNAMIC_BIN_PACK_END-1, ', size: ', /D, DYNAMIC_BIN_PACK_END-DYNAMIC_BIN_PACK
display '---------------------------------------------------'
display 'INT_VECTOR:          ', INT_VECTOR, '-', INT_VECTOR+256
display 'INT_VECTOR high:     ', INT_VECTOR_high
display 'INT_VECTOR high + 1: ', INT_VECTOR_high_1, ' ', INT_VECTOR_high_1 + INT_VECTOR_high_1 * 256, ' ', INT_VECTOR_high_1 + INT_VECTOR_high_1 * 256 + 1
display '---------------------------------------------------'
display 'free:                ', /D, 0xFFFF - INT_VECTOR - 255 
display '---------------------------------------------------'
