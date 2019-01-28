include "defines.asm"
ORG PROG_ADDR

static:
    incbin "static.bin"
static_end:

unpacker: ; и распаковщик
    LD HL, bufer_start
    LD DE, static
    CALL dzx7_standard
    JP static
    include "core/routines/zx7.a80"

bufer_start: equ $ ; запоминаем где заканчивается статическая байда
    ; суем после статической байды запакованый файл 
static_pack:
    incbin "static.bin.zx7"
static_pack_end:

org bufer_start; возвращаем адрес буфера 

dynamic_pack:
    incbin "dynamic.bin.zx7"
_end:

display "static ", static, " ", static_end, " ", /D, static_end-static
display "static_pack ", static_pack, " ", static_pack_end, " ", /D, static_pack_end-static_pack
; display "bufer_start ", bufer_start, " ", /D, cur_addr-PROG_ADDR
; display "dynamic ", dynamic, " ", /D, _data_pack-dynamic
; display "dynamic_pack ", dynamic_pack, " ", /D, _data_pack_end-dynamic_pack
; display "static_pack ", static_pack
; display "dynamic_pack ", dynamic_pack
; display "unpacker ", unpacker, " ", /D, _end-unpacker
display "_end ", _end

; LOAD_ADDR equ dynamic_pack
; boot.begin equ dynamic_pack
; boot.end equ _end
; boot.START_ADDR equ unpacker

;   include "core/routines/basic_boot_trd.asm"
;   EMPTYTRD "cell3326.trd" ;create empty TRD image
;   SAVETRD "cell3326.trd", "CELL3326.B", boot.Basic, boot.EndBasic - boot.Basic
;   SAVETRD "cell3326.trd","CELL3326.C",boot.begin,boot.end-boot.begin
