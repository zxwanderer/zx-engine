MODULE screenfx

    MACRO FxActionCell spr_num
        dw screenfx.fx_action_cell_me
        db spr_num
    ENDM

    MACRO ShowSprite pos_x, pos_y, spr_num
        dw screenfx.show_sprite_me
        db pos_y
        db pos_x
        db spr_num
    ENDM

; ----- показать спрайт на месте действия ( например удар об стенку)
fx_action_cell_me:
    PUSH HL
    LD A, ( Entities.MapCell_xy )
    LD HL, map.mapPos
    SUB (HL)
    ADD A,A ; так как у нас тайлы в 2 ячейки то умножаем результат на два
    LD E,A
    INC HL
    LD A, ( Entities.MapCell_xy+1 )
    SUB (HL)
    ADD A,A ; так как у нас тайлы в 2 ячейки то умножаем результат на два
    LD D,A ; в DE - экранная позиция
    POP HL
    mLDA
    PUSH HL
    CALL show_sprite    
    POP HL
    JP zxengine.process

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