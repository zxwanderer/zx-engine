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

; ( нужна для стирания информации для подготовки текста )
; процедура очистки строчек экрана
; на входе:
; в D - начальная строка
; в E - число строчек
clear_window:
    LD A, E
    LD (clear_window_row_num+1), A
    LD E, D
    LD D, 0
    CALL math.pos_scr; в DE - экранный адрес 
    PUSH DE; он еще нам пригодится

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

    ;очистили все данные, теперь цвет
    POP DE
    CALL math.addr_to_attr
    LD A, (clear_window_row_num+1)
    LD B,A
clean_row_loop2:
    PUSH BC
    LD B, 32; экранчик
    LD A, %00000100
clean_row_loop22:
    LD (DE), A
    INC DE
    DJNZ clean_row_loop22

    POP BC
    DJNZ clean_row_loop2

    RET


; Из журнала Deja Vu #04, Кемерово, 01.04.98
;  (c)Колотов Сеpгей, г.Шадpинск, SerzhSoft

str_frames_ptr: dw 00; указатель на строку куда впечатывать символы

PDEC_W ;Печать десятичного числа в HL (00000..65535)
    LD (str_frames_ptr), DE
    PUSH    HL            ;закинули печатаемое число на стек
    LD      HL,DECTB_W    ;адрес таблицы степеней десятки
    LD      B,#05         ;макс. возможное количество цифр

LP_PDW1 
    XOR     A             ;обнулили счетчик и флаг C для SBC
    LD      E,(HL)        ;взяли текущую степень
    INC     HL            ; десятки из таблицы
    LD      D,(HL)        ; и поместили в DE
    INC     HL            ;перешли к след. элементу таблицы
    EX      (SP),HL       ;адрес эл-та <-> печатаемое число

LP_PDW2:
    INC     A             ;увеличиваем счетчик
    SBC     HL,DE         ;вычитаем текущую степень десятки
    JR      NC,LP_PDW2    ;повторяем пока HL>=0
    ADD     HL,DE         ;HL=HL mod DE; A=HL div DE
    ADD     A,"0"-1       ;перевод A в ASCII-код ("0".."9")
    PUSH HL
    LD HL, (str_frames_ptr)
    LD (HL), A
    INC HL
    LD (str_frames_ptr), HL
    POP HL
    ; RST     #10           ;печать десятичной цифры
    EX      (SP),HL       ;HL=адрес эл-та, число -> на стек
    DJNZ    LP_PDW1       ;цикл по цифрам
    POP     HL            ;убрали оставшийся ноль со стека
    RET                   ;выход из процедуры

DECTB_W  ;Таблица степеней десятки;
    dw 10000
    dw 1000
    dw 100
    dw 10
    dw 1

show_frames:

    LD D, 0
    LD E, 1
    CALL screenfx.clear_window

    LD DE, str_frames
    LD HL, (interrupt.frame_counter)
    ; LD HL, (zxengine.frames_cnt)
    ; LD HL, (zxengine.frames_measured)
    CALL PDEC_W
    LD HL, str_frames
    LD DE, #0000
    CALL text.print_at

    RET
    
str_frames: defb "00000",0

ENDMODULE