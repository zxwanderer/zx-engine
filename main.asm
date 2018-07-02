DEVICE zxspectrum128

ORG #5B00
; ORG #5B00 ; уся память в наших руках c собственным IM 2!!!
; [code][static][dynamic]

code
  include "code.asm"

static:
  include "static.asm"

dynamic:
  include "dynamic.asm"

_all_end:

; display "----- code start: ", code_start
display /D, _all_end-code, " size, ", /D, 0x10000-_all_end, " free"
; display "----- all end: ", _all_end

display "----- code start: ", code
display "engine size: ", /D, static-code, ", code end: ", static
display "static data size: ", /D, dynamic-static, ", static end: ", static
display "font addr: ", p68_font
display "dynamic data size: ", /D, _all_end-dynamic, ", dynamic end: ", _all_end
; display "static data end: ", static_data_end, ", data size: ", /D, static_data_end-code_end
; display "dynamic data end: ", _data_end, ", data size: ", /D, _data_end-static_data_end
display "----- all end: ", _all_end

; LABELSLIST "mylabels.txt"

  ; прикрепляем к engine скрипты и определения
  SAVEBIN "static.bin", code, dynamic-code
  SAVEBIN "dynamic.bin", dynamic, _all_end-dynamic

SAVESNA "cell3326.sna",code

; LOAD_ADDR equ #8000
; boot.begin equ LOAD_ADDR
; boot.end equ _all_end
; include "core/routines/basic_boot_trd.asm"

  ; EMPTYTRD "cell3326.trd" ;create empty TRD image
	; SAVETRD "cell3326.trd", "CELL3326.B", boot.Basic, boot.EndBasic - boot.Basic
  ; SAVETRD "cell3326.trd","CELL3326.C",boot.begin,boot.end-boot.begin
