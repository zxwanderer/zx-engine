include "defines.asm"
ORG PROG_ADDR

incbin "static.bin"
incbin "dynamic.bin"
incbin "dynamic.bin.zx7"

  SAVEBIN "game.bin", PROG_ADDR, $-PROG_ADDR
  