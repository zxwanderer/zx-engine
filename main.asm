DEVICE zxspectrum128

ORG     #8000
code_start:
  ; LD SP, my_stack
  ; EI
  ; call interrupt.int_init
  ; interrupt.init
  DI
  LD   A,#E0
  LD   I,A
  ; IM   2
  EI
  ; LD HL, TILE_SET
  ; LD (Tiles16.sprArray), HL
/* start:
  LD B, #80
loop:
  LD A,B
  OUT(#FE),A
  DJNZ loop
  NOP
  NOP
  NOP
  NOP */
  jp zxengine.start
  include "core/defines.asm"
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
  ; incbin "data/fonts/tripfont_revert.fnt"
  incbin "data/fonts/Font57_revert.fnt"
    /* incbin "data/fonts/casa2_revert.fnt" */

_data_end:

; my_stack:
  ; DEFS 257,00

  include "core/interrupt.asm"

_all_end:

display /D, _data_end-code_start, " size, ", /D, 0xE000-_data_end, " free"
display "----- code start: ", code_start
display "logic data end: ", _logic_data_end
display "font addr: ", p68_font
display "data end: ", _data_end
display "----- all end: ", _all_end

display "check_action: ", Entities.check_action
display "fx_action_cell_me: ", screenfx.fx_action_cell_me
display "lookChar: ", Entities.lookChar
; display "calc_ce: ", Text68.calc_ce

LABELSLIST "mylabels.txt"
SAVESNA "myzx.sna",code_start
