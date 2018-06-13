DEVICE zxspectrum128

  include "core/defines.asm"
  include "middlware/defines/CellType.asm"
  include "middlware/defines/ItemType.asm"
  include "middlware/defines/Item.asm"
  include "middlware/defines/Hero.asm"

ORG     #6000
; ORG #5B00 ; уся память в наших руках c собственным IM 2!!!

code_start:
  DI
  LD SP, my_stack_end
  CALL interrupt.init
  jp zxengine.start
  include "core/scankeys.asm"
  include "core/engine.asm"
  include "middlware/defines.asm"
  include "core/routines/math.asm"
  include "core/routines/tiles16.asm"
  include "core/routines/input.asm"
  include "core/routines/zx7.a80"
  include "middlware/beeper.asm"
  include "middlware/screenfx.asm"
  include "middlware/text.asm"
  include "middlware/screen.asm"
  include "middlware/map.asm"
  include "middlware/vars.asm"
  include "middlware/entities.asm"
  include "middlware/items.asm"
  include "core/interrupt.asm"
my_stack:
  DEFS 100, 00
my_stack_end:

code_end:

static_start:
FX_SET:
  include "data/demoFX.asm"
FX_SET_END

TILE_SET:
  include "data/graph/tiles_many.asm"
TILE_SET_END

LANG_SET:
  include "data/lang/lang_ru.asm"
  ; include "data/lang/lang_en.asm"
LANG_SET_END

ORG (high $+1)*256
p68_font:
  incbin "data/fonts/tripfont_revert.fnt"
  ; incbin "data/fonts/Font57_revert.fnt"
  ; incbin "data/fonts/casa2_revert.fnt"
_after_font:

static_end:

START_SCRIPT:
  include "data/script.asm"
MAP_SET:
	; include "data/maps/laboratory.asm"
  ; include "data/maps/laboratory_old.asm"
  include "data/maps/laboratory_demo.asm"
MAP_SET_END
ENCOUNTER_SET:
  include "data/items/shard.asm"
	include "data/maps/rebelstar_enc.asm"
ENCOUNTER_SET_END

dynamic_end:

_all_end:

display "----- code start: ", code_start
display /D, _all_end-code_start, " size, ", /D, 0xE000-_all_end, " free"
display "----- all end: ", _all_end

; display "----- code start: ", code_start
; display "code end: ", code_end, ", engine size :", /D, code_end-code_start
; display "font addr: ", p68_font
; display "static data end: ", static_data_end, ", data size: ", /D, static_data_end-code_end
; display "dynamic data end: ", _data_end, ", data size: ", /D, _data_end-static_data_end
; display "----- all end: ", _all_end

LABELSLIST "mylabels.txt"

  ; display "engine: ", code_start, " ", /D, code_end-code_start
  ; display "static: ", code_end, " ", /D, static_end-code_end
  ; display "dynamic: ", static_end, " ", /D, dynamic_end-static_end

  ; SAVEBIN "engine.bin", code_start, code_end-code_start
  ; SAVEBIN "static.bin", code_end, static_end-code_end
  ; SAVEBIN "dynamic.bin", static_end, dynamic_end-static_end

SAVESNA "cell3326.sna",code_start

; LOAD_ADDR equ #8000
; boot.begin equ LOAD_ADDR
; boot.end equ _all_end
; include "core/routines/basic_boot_trd.asm"

  ; EMPTYTRD "cell3326.trd" ;create empty TRD image
	; SAVETRD "cell3326.trd", "CELL3326.B", boot.Basic, boot.EndBasic - boot.Basic
  ; SAVETRD "cell3326.trd","CELL3326.C",boot.begin,boot.end-boot.begin
