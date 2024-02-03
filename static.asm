; 0 - игра не окончена никак
; 1 - хеппи-енд
; 2 - геймовер
IS_GAME_OVER
  defb 00

TILE_SET:
  incbin "tiles.bin"
  ; include "data/graph/tiles_many.asm"
TILE_SET_END

LANG_SET:
  INCLUDE LANG_FILE
LANG_SET_END

START_SCRIPT:
  include "data/script.asm"
  ; include "data/cursor_look.asm"
START_SCRIPT_END

ENCOUNTER_SET:
	include "data/rebelstar_enc.asm"
  include "data/cells/empty.asm"
  ; include "data/cells/items/shard.asm"
  ; include "data/cells/items/chair.asm"
  ; include "data/cells/items/nippers.asm"
  include "data/cells/grass.asm"
  include "data/cells/floor.asm"
  include "data/cells/trash.asm"
  include "data/cells/breaking.asm"
  include "data/cells/body.asm"
  include "data/cells/bed.asm"
  include "data/cells/pda.asm"
  include "data/cells/memo.asm"
  include "data/cells/medicine.asm"
  include "data/cells/book.asm"
  ; include "data/cells/generator.asm"
  include "data/cells/computer/computer_break.asm"
  include "data/cells/computer/computer_off.asm"
  include "data/cells/computer/computer.asm"
  include "data/cells/door.asm"
  include "data/cells/electronic/electronic.asm"
  include "data/cells/electronic/electronic_break.asm"
  include "data/cells/heroes/Hero09.asm"
  ; include "data/cells/heroes/HeroDead.asm"
  include "data/cells/locker.asm"
  include "data/cells/cavity.asm"
  include "data/cells/wall/soft_wall_break.asm"
  include "data/cells/wall/soft_wall.asm"
  include "data/cells/wall/wall_grid.asm"
  include "data/cells/wall/wall.asm"
  include "data/cells/_index.asm"
ENCOUNTER_SET_END

; (!) код плеера должен быть в быстрой памяти как Shiru сказал (!!!)
; На 48K это просто любая память выше 32768, на оригинальных 128K 
; есть сложности: на 128K и +2 медленные страницы 1,3,5,7; 
; на +2A и +3 медленные страницы 4,5,6,7. Т.е. для корректной работы 
; на всех оригинальных моделях плеер надо обязательно поместить в страницу 0 или 2.
; На данный момент подключается аккурат во 2ю страницу ( FX_SET: 0xBC46)
FX_SET:
  include "data/demoFX.asm"
FX_SET_END

TRITONE:
  include "core/routines/music_tritone.asm"

  include "data/music/AER/foryou.asm"

  MODULE gameover
  include "data/music/AER/gameover.asm"
  ENDMODULE

  MODULE gameend
  include "data/music/AER/gameend.asm"
  ENDMODULE

TRITONE_END

DISPLAY "FX_SET ", FX_SET

ORG (high $+1)*256
p68_font:
  ; incbin "data/fonts/tripfont_revert.fnt"
  incbin "data/fonts/Font57_revert.fnt"
  ; incbin "data/fonts/casa2_revert.fnt"
p68_font_end:
