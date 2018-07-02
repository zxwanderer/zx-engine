include "defines.asm"
ORG PROG_ADDR

incbin "static.bin"
incbin "dynamic.bin"
incbin "dynamic.bin.zx7"

_end:

LOAD_ADDR equ PROG_ADDR
boot.begin equ PROG_ADDR
boot.end equ _end

  include "core/routines/basic_boot_trd.asm"
  EMPTYTRD "cell3326.trd" ;create empty TRD image
  SAVETRD "cell3326.trd", "CELL3326.B", boot.Basic, boot.EndBasic - boot.Basic
  SAVETRD "cell3326.trd","CELL3326.C",boot.begin,boot.end-boot.begin
