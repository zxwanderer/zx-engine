DEVICE zxspectrum128

  include "core/defines.asm"

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

START_SCRIPT:
  include "data/script.asm"
LANG_SET:
  include "data/lang/lang_ru.asm"
LANG_SET_END
TILE_SET:
  include "data/graph/tiles_many.asm"
TILE_SET_END
MAP_SET:
	; include "data/maps/laboratory.asm"
  ; include "data/maps/laboratory_old.asm"
  include "data/maps/laboratory_demo.asm"
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

_all_end:

display /D, _data_end-code_start, " size, ", /D, 0xE000-_data_end, " free"
display "----- code start: ", code_start
display "code end: ", code_end, ", engine size :", /D, code_end-code_start
display "data end: ", _logic_data_end, ", data size: ", /D, _logic_data_end-code_end
display "font addr: ", p68_font
display "after font:", _after_font
display "----- all end: ", _all_end

; display "chair_script_binary ", chair_script_binary
; display "binary_get_or_drop_item ", binary_get_or_drop_item

; display "char_do_get_drop ", Entities.char_do_get_drop
; display "CELL_TYPES ", CELL_TYPES
; display "ITEM_ARRAY ", ITEM_ARRAY
; display "add_item_to_map ", items.add_item_to_map

; display "chair_script ", chair_script

; display "check_action: ", Entities.check_action
; display "fx_action_cell_me: ", screenfx.fx_action_cell_me
; display "lookChar: ", Entities.lookChar
; display "calc_ce: ", Text68.calc_ce

; display "char_no_get ", Entities.char_no_get

display "interrupt.init ", interrupt.init

LABELSLIST "mylabels.txt"

SAVESNA "cell3326.sna",code_start
; SAVETAP "cell3326.tap",code_start

LOAD_ADDR equ #6000
boot.begin equ LOAD_ADDR
boot.end equ _all_end
include "core/routines/basic_boot_trd.asm";

  EMPTYTRD "cell3326.trd" ;create empty TRD image
	SAVETRD "cell3326.trd", "CELL3326.B", boot.Basic, boot.EndBasic - boot.Basic
  SAVETRD "cell3326.trd","CELL3326.C",boot.begin,boot.end-boot.begin
