
code:
  include "code.asm"
static:
  include "static.asm"
dynamic:
  include "dynamic.asm"

pack_dynamic:

_all_end:

display /D, _all_end-code, " size, ", /D, INT_VECTOR-_all_end, " free"

display "----- code start: ", code
display "engine size: ", /D, static-code, ", code end: ", static
display "static data size: ", /D, dynamic-static, ", static end: ", static
display "font addr: ", p68_font, ", pre-font unused size: ", /D, p68_font - LANG_SET_END
display "dynamic data size: ", /D, _all_end-dynamic, ", dynamic end: ", _all_end
display "----- all end: ", _all_end

display binary_show_cell_info
display CELL_TYPES
display Computer_cell_name
display ComputerBreak.computer_break_script
; LABELSLIST "mylabels.txt"

  ; прикрепляем к engine скрипты и определения
  ; SAVEBIN "static.bin", code, dynamic-code
  ; SAVEBIN "dynamic.bin", dynamic, _all_end-dynamic

; SAVESNA "cell3326.sna",code

; LOAD_ADDR equ #8000
; boot.begin equ LOAD_ADDR
; boot.end equ _all_end
; include "core/routines/basic_boot_trd.asm"

  ; EMPTYTRD "cell3326.trd" ;create empty TRD image
	; SAVETRD "cell3326.trd", "CELL3326.B", boot.Basic, boot.EndBasic - boot.Basic
  ; SAVETRD "cell3326.trd","CELL3326.C",boot.begin,boot.end-boot.begin
