; модуль отрисовываемого "окна"
MODULE View

; копируем тайлы из карты в массив отрисовки
; в HL адрес первого тайла карты
copy:
    LD IX, View.buffer
    LD B, scrHeight
copy_loop2:
    PUSH BC
    PUSH HL

    LD B,scrWidth
copy_loop1:
    PUSH BC

    LD A, (HL)
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