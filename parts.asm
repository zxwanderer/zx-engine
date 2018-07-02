include "defines.asm"
ORG PROG_ADDR

include "main.asm"

; pack_dynamic: ; фейковый указатель на запакованную динамическую часть

  SAVEBIN "static.bin", code, dynamic-code
  SAVEBIN "dynamic.bin", dynamic, _all_end-dynamic
