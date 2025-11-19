include "defines.asm"
ORG PROG_ADDR

define LANG_FILE "data/lang/lang_ru.asm"

include "main.asm"

  SAVEBIN "static.bin", code, dynamic-code
  SAVEBIN "dynamic.bin", dynamic, dynamic_end-dynamic
  ; SAVEBIN "fullgame.bin", code, _all_end-code
