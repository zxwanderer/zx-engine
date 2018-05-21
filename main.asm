DEVICE zxspectrum128

ORG     #8000
code_start:
  call interrupt.int_init
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
ORG (high $+1)*256
p68_font:
  ; incbin "data/fonts/tripfont_revert.fnt"
  incbin "data/fonts/Font57_revert.fnt"
    /* incbin "data/fonts/casa2_revert.fnt" */
_data_end:

  include "core/interrupt.asm"

display /D, _data_end-code_start, " size, ", /D, 0xE000-_data_end, " free"
display "font addr: ", p68_font
display "code start: ", code_start
display "data end: ", _data_end

SAVESNA "myzx.sna",code_start
