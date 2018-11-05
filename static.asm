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

; 0 - игра не окончена никак
; 1 - хеппи-енд
; 2 - геймовер
IS_GAME_OVER
  defb 00

TILE_SET:
  include "data/graph/tiles_many.asm"
TILE_SET_END

LANG_SET:
  INCLUDE LANG_FILE
  ; include "data/lang/lang_en.asm"
LANG_SET_END

ORG (high $+1)*256
p68_font:
  ; incbin "data/fonts/tripfont_revert.fnt"
  incbin "data/fonts/Font57_revert.fnt"
  ; incbin "data/fonts/casa2_revert.fnt"
_after_font:

START_SCRIPT:
  include "data/script.asm"
  include "data/cursor_look.asm"

ENCOUNTER_SET:
	include "data/rebelstar_enc.asm"
  include "data/cells/empty.asm"
  include "data/cells/shard.asm"
  include "data/cells/chair.asm"
  include "data/cells/floor.asm"
  include "data/cells/floor_white.asm"
  include "data/cells/floor_cyan.asm"
  include "data/cells/floor_red.asm"
  include "data/cells/trash.asm"
  include "data/cells/bed.asm"
  include "data/cells/computer/computer_break.asm"
  include "data/cells/computer/computer_off.asm"
  include "data/cells/computer/computer.asm"
  include "data/cells/door/door_open.asm"
  include "data/cells/door/door.asm"
  include "data/cells/door/door_blue.asm"
  include "data/cells/door/door_white.asm"
  include "data/cells/door/door_red_hard.asm"
  include "data/cells/electronic/electronic.asm"
  include "data/cells/electronic/electronic_break.asm"
  include "data/cells/heroes/Hero09.asm"
  include "data/cells/heroes/HeroDead.asm"
  include "data/cells/wall/soft_wall_break.asm"
  include "data/cells/wall/soft_wall.asm"
  include "data/cells/wall/wall.asm"
ENCOUNTER_SET_END
