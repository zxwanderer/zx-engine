DEVICE zxspectrum48

  include "core/defines.asm"

ORG     #8000
; ORG #5B00 ; уся память в наших руках c собственным IM 2!!!

code_start:
  DI
  LD SP, my_stack_end
  interrupt.init #E0
  jp zxengine.start
  include "core/scankeys.asm"
  include "core/engine.asm"
  include "core/routines/math.asm"
  include "core/routines/tiles16.asm"
  include "core/routines/input.asm"
  include "middlware/beeper.asm"
  include "middlware/screenfx.asm"
  include "middlware/text.asm"
  include "middlware/screen.asm"
  include "middlware/map.asm"
  include "middlware/entities.asm"
  include "middlware/items.asm"

my_stack:
  DEFS 100, 00
my_stack_end:

code_end:

START_SCRIPT:
  include "data/script.asm"
LANG_SET:
  include "data/lang/lang_ru.asm"
LANG_SET_END
TILE_SET:
  include "data/graph/tiles_many.asm"
TILE_SET_END
MAP_SET:
	include "data/maps/laboratory.asm"
MAP_SET_END
ENCOUNTER_SET:
	include "data/maps/rebelstar_enc.asm"
ENCOUNTER_SET_END

FX_SET:
  include "data/demoFX.asm"
FX_SET_END

_logic_data_end:

ORG (high $+1)*256
p68_font:
  incbin "data/fonts/tripfont_revert.fnt"
  ; incbin "data/fonts/Font57_revert.fnt"
    ; incbin "data/fonts/casa2_revert.fnt"
_after_font:

_data_end

  include "core/interrupt.asm"

_all_end:

display /D, _data_end-code_start, " size, ", /D, 0xE000-_data_end, " free"
display "----- code start: ", code_start
display "code end: ", code_end, ", engine size :", /D, code_end-code_start
display "data end: ", _logic_data_end, ", data size: ", /D, _logic_data_end-code_end
display "font addr: ", p68_font
display "after font:", _after_font
display "----- all end: ", _all_end

; display "check_action: ", Entities.check_action
; display "fx_action_cell_me: ", screenfx.fx_action_cell_me
; display "lookChar: ", Entities.lookChar
; display "calc_ce: ", Text68.calc_ce

LABELSLIST "mylabels.txt"
SAVESNA "myzx.sna",code_start
