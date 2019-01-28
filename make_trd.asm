include "defines.asm"
ORG PROG_ADDR

static:
    incbin "static.bin"
dynamic:
    incbin "dynamic.bin"
_data_pack:

cur_addr equ $ 

dynamic_pack:
    incbin "dynamic.bin.zx7"
static_pack:
    incbin "static.bin.zx7"
_data_pack_end:
unpacker:
    LD HL, static_pack
    LD DE, static
    CALL dzx7_standard
    JP static
    include "core/routines/zx7.a80"

_end:

display "static ", static, " ", /D, dynamic-static
display "dynamic ", dynamic, " ", /D, _data_pack-dynamic
display "dynamic_pack ", dynamic_pack, " ", /D, _data_pack_end-dynamic_pack
; display "static_pack ", static_pack
; display "dynamic_pack ", dynamic_pack
display "unpacker ", unpacker, " ", /D, _end-unpacker
display "_end ", _end

; LOAD_ADDR equ dynamic_pack
; boot.begin equ dynamic_pack
; boot.end equ _end
; boot.START_ADDR equ unpacker

;   include "core/routines/basic_boot_trd.asm"
;   EMPTYTRD "cell3326.trd" ;create empty TRD image
;   SAVETRD "cell3326.trd", "CELL3326.B", boot.Basic, boot.EndBasic - boot.Basic
;   SAVETRD "cell3326.trd","CELL3326.C",boot.begin,boot.end-boot.begin
