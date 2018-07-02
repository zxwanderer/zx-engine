;  DEVICE zxspectrum48
    ; ORG #6000
depack:
    ld HL,begin
    LD DE, #8000
    call dzx7_standard
    JP #8000
    include "core/routines/zx7.a80"

begin:
    incbin "game.bin.zx7"
end:

;  DISPLAY " ---------- "
;  DISPLAY "end: ", end
;  DISPLAY "pack size: ", /D, end-depack

;  savebin "pack.bin",depack,end-depack
 
;   ./bin/bin2tap -b -hp pack.bin -c 24575 -a 24576 -r 24576
