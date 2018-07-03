include "defines.asm"
ORG PROG_ADDR

static:
    incbin "static.bin"
dynamic:
    incbin "dynamic.bin"
dynamic_pack:
    incbin "dynamic.bin.zx7"
static_pack:
    incbin "static.bin.zx7"
unpacker:
    LD HL,static_pack
    LD DE, static
    CALL dzx7_standard
    JP static
    include "core/routines/zx7.a80"

_end_all:

  display "BINARY SIZE: ", /D, _end_all-dynamic_pack, " ", _end_all-dynamic_pack
  display "BINARY BEGIN: ", dynamic_pack, " (", /D, dynamic_pack, ")"
  display "BINARY START: ", unpacker, " (", /D, unpacker, ")"
  SAVEBIN "game.bin", dynamic_pack, _end_all-dynamic_pack
;   SAVEBIN "game.bin", PROG_ADDR, $-PROG_ADDR
  