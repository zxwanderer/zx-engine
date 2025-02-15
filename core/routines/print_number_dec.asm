    ifndef _PRINT_NUMBER_DEC_ASM_
    define _PRINT_NUMBER_DEC_ASM_

; Из журнала Deja Vu #04, Кемерово, 01.04.98
;  (c)Колотов Сеpгей, г.Шадpинск, SerzhSoft

PDEC_W_str_ptr: dw 00; указатель на строку куда впечатывать символы

; Печать десятичного числа хранящегося в HL (00000..65535)
; DE - указатель на переменную в которую печатаем символы
PDEC_W 
    LD (PDEC_W_str_ptr), DE
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
    LD HL, (PDEC_W_str_ptr)
    LD (HL), A
    INC HL
    LD (PDEC_W_str_ptr), HL
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

    endif
