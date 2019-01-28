include "defines.asm"
ORG PROG_ADDR

static:
    incbin "static.bin"
dynamic:
    incbin "dynamic.bin"
dynamic_pack:
    incbin "dynamic.bin.zx7"
; static_pack:
;     incbin "static.bin.zx7"
; unpacker:
;     LD HL,static_pack
;     LD DE, static
;     CALL dzx7_standard
;     JP static
;     include "core/routines/zx7.a80"

_end_all:

  display "BINARY SIZE: ", /D, _end_all-PROG_ADDR, " ", _end_all-static
  display "BINARY BEGIN: ", PROG_ADDR, " (", /D, PROG_ADDR, ")"
  display "BINARY START: ", PROG_ADDR, " (", /D, PROG_ADDR, ")"
  SAVEBIN "cell3326.bin", PROG_ADDR, _end_all-PROG_ADDR
;   SAVEBIN "game.bin", PROG_ADDR, $-PROG_ADDR
  