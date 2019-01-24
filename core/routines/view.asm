; модуль отрисовываемого "окна"
MODULE View

  MACRO m_look_dir _dir
    PUSH DE
    LD A, _dir
    CALL look_dir
    POP DE
  ENDM

; вход:
; D - x, E - y,
; A - dir
look:
    m_look_dir dir_down

    m_look_dir dir_down_left

    m_look_dir dir_left

    m_look_dir dir_up_left

    m_look_dir dir_up

    m_look_dir dir_up_right

    m_look_dir dir_right

    m_look_dir dir_down_right

    m_look_dir dir_center

    CALL map.center_map
    CALL View.copy

    RET

look_dir:
    CALL Entities.calc_action_pos
    RET NC;  возвратили false - неправильное направление или действие    

update_mask_hl:
    LD DE, MAP_MASK-MAP_SET ; так как у нас в процедуре вернулась позиция на MAP_SET 
    ADD HL, DE
    LD A, 1
    LD (HL), A
    RET

; копируем тайлы из карты в массив отрисовки
; в HL адрес первого тайла карты
copy:
    LD DE, MAP_MASK-MAP_SET ; так как у нас в процедуре вернулась позиция на MAP_SET 
    ADD HL, DE

    LD DE, MAP_SET-MAP_MASK; для использования в цикле 

    LD IX, View.buffer
    LD B, scrHeight
copy_loop2:
    PUSH BC
    PUSH HL

    LD B,scrWidth
copy_loop1:
    PUSH BC

    LD A, (HL)
    AND A
    JR Z, no_copy_cell

    PUSH HL
    ADD HL, DE
    LD A, (HL)
    POP HL

no_copy_cell:
    LD (IX), A

    INC IX
    INC HL
    
    POP BC
    DJNZ copy_loop1

    POP HL
    LD BC, mapSize
    ADD HL, BC; прибавляем к указателю на начало тайлов ширину - сдвигаем указатель вниз на 1 тайл

    POP BC
    DJNZ copy_loop2
    RET

; отрисовываем тайлы на экране
draw:
    LD HL, View.buffer
    LD DE, SCREEN_ADDR ; current pos draw variable
    LD B, scrHeight
draw_loop2:
    PUSH BC
    PUSH DE

    LD B, scrWidth
draw_loop1:
    PUSH BC
    PUSH HL

    PUSH DE
    LD A,(HL)
    call Tiles16.spr_index_to_addr
    call Tiles16.show_tile_on_map
    POP DE
    Tiles16.NEXT_TILE_POS_RIGHT

    POP HL
    INC HL
    POP BC
    DJNZ draw_loop1   

    POP DE
    Tiles16.NEXT_TITLE_POS_DOWN
    POP BC
    DJNZ draw_loop2

    RET

; буфер тайлов
buffer:
    DUP scrHeight*scrWidth
    defb #01
    EDUP

ENDMODULE