
code:
  include "code.asm"
code_end:

static:
  include "static.asm"
static_end:

dynamic:
  include "dynamic.asm"
dynamic_end:

pack_dynamic:
  ; incbin "dynamic.bin.zx7"
; pack_dynamic_end:

; _all_end:

display 'PROGRAM_ORG: ', code
display '-----------------------------------------'
display 'Code:           ', code, '-', code_end-1, ', size: ', /D, code_end - code
display 'Static:         ', static, '-', static_end-1,', size: ', /D, static_end - static
display ' LANG_SET:      ', LANG_SET, '-', LANG_SET_END-1,', size: ', /D, LANG_SET_END-LANG_SET
display ' START_SCRIPT:  ', START_SCRIPT, '-', START_SCRIPT_END-1,', size: ', /D, START_SCRIPT_END-START_SCRIPT
display ' ENCOUNTER_SET: ', ENCOUNTER_SET, '-', ENCOUNTER_SET_END-1,', size: ', /D, ENCOUNTER_SET_END-ENCOUNTER_SET
display ' -CELL_TYPES    ', CELL_TYPES, '-', CELL_TYPES_END-1,', size: ', /D, CELL_TYPES_END-CELL_TYPES
display ' -ITEM_TYPES    ', ITEM_TYPES, '-', ITEM_TYPES_END-1,', size: ', /D, ITEM_TYPES_END-ITEM_TYPES
display ' TILE_SET:      ', TILE_SET, '-', TILE_SET_END-1,', size: ', /D, TILE_SET_END-TILE_SET
display ' FX_SET:        ', FX_SET, '-', FX_SET_END-1,', size: ', /D, FX_SET_END-FX_SET
display ' TRITONE:       ', TRITONE, '-', TRITONE_END-1,', size: ', /D, TRITONE_END-TRITONE
display '[Free]          ', TRITONE_END, '-', p68_font, ', size: ', /D, p68_font - TRITONE_END
display ' Font:          ', p68_font, '-', p68_font_end, ', size: ', /D, p68_font_end - p68_font
display 'Dynamic:        ', dynamic, '-', dynamic_end-1, ', size: ', /D, dynamic_end - dynamic
display ' MAP_MASK:      ', MAP_MASK, '-', MAP_MASK_END-1,', size: ', /D, MAP_MASK_END-MAP_MASK
display ' MAP_SET:       ', MAP_SET, '-', MAP_SET_END-1,', size: ', /D, MAP_SET_END-MAP_SET
display ' CHARS_SET:     ', CHARS_SET, '-', CHARS_SET_END-1,', size: ', /D, CHARS_SET_END-CHARS_SET
display ' ITEM_ARRAY:    ', ITEM_ARRAY, '-', ITEM_ARRAY_END-1,', size: ', /D, ITEM_ARRAY_END-ITEM_ARRAY

; display binary_calc_hero_cursor_pos
; display CELL_TYPES
; display Computer_cell_name
; display ComputerBreak.computer_break_script
  LABELSLIST "cell3326.list"

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
