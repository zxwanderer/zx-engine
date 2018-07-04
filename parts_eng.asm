include "defines.asm"
ORG PROG_ADDR

define LANG_FILE "data/lang/lang_en.asm"
include "main.asm"

  SAVEBIN "static_eng.bin", code, dynamic-code
  SAVEBIN "dynamic_eng.bin", dynamic, _all_end-dynamic
