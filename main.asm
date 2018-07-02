DEVICE zxspectrum128

  include "core/defines.asm"
  include "middlware/defines.asm"
  include "middlware/defines/CellType.asm"
  include "middlware/defines/ItemType.asm"
  include "middlware/defines/Item.asm"
  include "middlware/defines/Hero.asm"
ORG #5B00
; ORG #5B00 ; уся память в наших руках c собственным IM 2!!!

; [code][static][dynamic]

code_start:
  DI
  LD SP, my_stack_end
  CALL interrupt.init
  CALL zxengine.init
  jp zxengine.start
  include "core/scankeys.asm"
  include "core/engine.asm"
  include "core/routines/math.asm"
  include "core/routines/tiles16.asm"
  include "core/routines/input.asm"
  include "core/routines/zx7.a80"
  include "middlware/beeper.asm"
  include "middlware/screenfx.asm"
  include "middlware/text.asm"
  include "middlware/screen.asm"
  include "middlware/map.asm"
  include "middlware/defines/Vars.asm" ; если разместить в начале, то тупой компилятор ругается на forvard reference из-за ссылки на zxengine.varsTab несмотря на два прохода
  include "middlware/entities.asm"
  include "middlware/items.asm"
  include "core/interrupt.asm"
my_stack:
  DEFS 100, 00
my_stack_end:

; code_end:

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

START_SCRIPT:
  include "data/script.asm"

ENCOUNTER_SET:
	include "data/rebelstar_enc.asm"
  include "data/cells/empty.asm"
  include "data/cells/shard.asm"
  include "data/cells/chair.asm"
  include "data/cells/floor.asm"
  include "data/cells/trash.asm"
  include "data/cells/bed.asm"
  include "data/cells/computer/computer_break.asm"
  include "data/cells/computer/computer_off.asm"
  include "data/cells/computer/computer.asm"
  include "data/cells/door/door_open.asm"
  include "data/cells/door/door.asm"
  include "data/cells/electronic/electronic.asm"
  include "data/cells/electronic/electronic_break.asm"
  include "data/cells/wall/soft_wall_break.asm"
  include "data/cells/wall/soft_wall.asm"
  include "data/cells/wall/wall.asm"
ENCOUNTER_SET_END

; static_end:

dynamic_start:

MAP_SET:
	; include "data/maps/laboratory.asm"
  ; include "data/maps/laboratory_old.asm"
  include "data/maps/laboratory_demo.asm"
  include "data/heroes.asm"
MAP_SET_END

; dynamic_end:

_all_end:

; display "----- code start: ", code_start
display /D, _all_end-code_start, " size, ", /D, 0x10000-_all_end, " free"
; display "----- all end: ", _all_end

display "----- code start: ", code_start
display "engine size: ", /D, static_start-code_start, ", code end: ", static_start
display "static data size: ", /D, dynamic_start-static_start, ", static end: ", static_start
display "font addr: ", p68_font
display "dynamic data size: ", /D, _all_end-dynamic_start, ", dynamic end: ", _all_end
; display "static data end: ", static_data_end, ", data size: ", /D, static_data_end-code_end
; display "dynamic data end: ", _data_end, ", data size: ", /D, _data_end-static_data_end
display "----- all end: ", _all_end

; LABELSLIST "mylabels.txt"

  ; прикрепляем к engine скрипты и определения
  SAVEBIN "static.bin", code_start, dynamic_start-code_start
  SAVEBIN "dynamic.bin", dynamic_start, _all_end-dynamic_start

SAVESNA "cell3326.sna",code_start

; LOAD_ADDR equ #8000
; boot.begin equ LOAD_ADDR
; boot.end equ _all_end
; include "core/routines/basic_boot_trd.asm"

  ; EMPTYTRD "cell3326.trd" ;create empty TRD image
	; SAVETRD "cell3326.trd", "CELL3326.B", boot.Basic, boot.EndBasic - boot.Basic
  ; SAVETRD "cell3326.trd","CELL3326.C",boot.begin,boot.end-boot.begin
