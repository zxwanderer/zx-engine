include "defines.asm"
ORG PROG_ADDR

; так как сжатая игра не лезет в память то приходится грузить файл static без сжатия
; а сжатый только dynamic
static:
    incbin "static.bin"

dynamic:
    incbin "dynamic.bin"

dynamic_pack:
    incbin "dynamic.bin.zx7"
_end:

; display "static ", static, " ", static_end, " ", /D, static_end-static
; display "static_pack ", static_pack, " ", static_pack_end, " ", /D, static_pack_end-static_pack
; display "bufer_start ", bufer_start, " ", /D, cur_addr-PROG_ADDR
; display "dynamic ", dynamic, " ", /D, _data_pack-dynamic
; display "dynamic_pack ", dynamic_pack, " ", /D, _data_pack_end-dynamic_pack
; display "static_pack ", static_pack
; display "dynamic_pack ", dynamic_pack
; display "unpacker ", unpacker, " ", /D, _end-unpacker
; display "_end ", _end

LOAD_ADDR equ static
boot.begin equ LOAD_ADDR
boot.end equ _end
boot.START_ADDR equ static

  include "core/routines/basic_boot_trd.asm"
  EMPTYTRD "cell3326.trd" ;create empty TRD image
  SAVETRD "cell3326.trd", "CELL3326.B", boot.Basic, boot.EndBasic - boot.Basic
  SAVETRD "cell3326.trd","CELL3326.C",boot.begin,boot.end-boot.begin
