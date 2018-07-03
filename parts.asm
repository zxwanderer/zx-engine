include "defines.asm"
ORG PROG_ADDR

include "main.asm"

  SAVEBIN "static.bin", code, dynamic-code
  SAVEBIN "dynamic.bin", dynamic, _all_end-dynamic
