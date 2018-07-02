include "defines.asm"
ORG PROG_ADDR
; [code][static][dynamic]

incbin "static.bin"
incbin "dynamic.bin"
; pack_dynamic:
incbin "dynamic.bin.zx7"

SAVESNA "cell3326.sna",PROG_ADDR
