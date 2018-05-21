MODULE screenfx

    MACRO ShowSprite pos_x, pos_y, spr_num
        dw screenfx.show_sprite_me
        db pos_y
        db pos_x
        db spr_num
    ENDM

show_sprite_me:
    mLDE; в DE позиция
    mLDA
    PUSH HL
    CALL show_sprite
    POP HL
    JP zxengine.process

; ----- показать один спрайт на экране ( для эффектов )
; в DE - экранная позиция
; в A - номер спрайта
show_sprite:
  CALL Tiles16.spr_index_to_addr; в HL у нас указатель на спрайт
  CALL math.pos_scr
  JP Tiles16.show_tile_on_map
  RET

ENDMODULE