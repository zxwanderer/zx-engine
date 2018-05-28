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
    LD A, ( Entities.MapCell_xy+Point.y )
    LD HL, map.mapPos
    SUB (HL)
    ADD A,A ; так как у нас тайлы в 2 ячейки то умножаем результат на два
    LD E,A
    INC HL
    LD A, ( Entities.MapCell_xy+Point.x )
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

; процедура очистки строчек экрана
; на входе:
; в D - начальная строка
; в E - число строчек
;
clear_window:
    LD A, E
    LD (clear_window_row_num+1), A
    LD E, D
    LD D, 0
    CALL math.pos_scr; в DE - экранный адрес 

clear_window_row_num:
    LD B, #00
next_row_loop:
    PUSH BC
    PUSH DE

; цикл по заполнению одной строки
    XOR A
    LD B, 32; экранчик шириной 32 знакоместа
clean_row_loop:
    PUSH DE
    DUP 8
    LD (DE),A
    INC D
    EDUP
    POP DE
    INC DE
    DJNZ clean_row_loop ;  цикл по одной строке 

    POP DE; сняли со стека экранный адрес    
    CALL math.down_pos; перешли на следующую строчку
    
    POP BC
    DJNZ next_row_loop
    RET


ENDMODULE