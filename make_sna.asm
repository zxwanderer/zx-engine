include "defines.asm"
ORG PROG_ADDR

incbin "static.bin"
incbin "dynamic.bin"
incbin "dynamic.bin.zx7"

SAVESNA "cell3326.sna",PROG_ADDR
