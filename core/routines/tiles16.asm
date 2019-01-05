; модуль вывода тайлов 2x2 знакоместа ( 16 x16 пикселов  )
; для работы надо установить sprArray - указатель на массив тайлов
  MODULE Tiles16

; переводим индекс карты в указатель на начало данных спрайта
; A - номер спрайта
; на выходе HL - указатель на данные спрайта
; затрагивается регистр BC!!!
spr_index_to_addr:
  LD L, A
  LD H, 0; загружаем номер спрайта в HL
  ADD HL,HL; x2
  ADD HL,HL; x4
  PUSH HL; // запоминаем x4
  ADD HL,HL; x8
  ADD HL,HL; x16
  ADD HL,HL; x32
  POP BC; // снимаем со стека x4 - еще 4 байта цветности
  ADD HL, BC
  LD BC, TILE_SET; указатель на начало спрайтов
  ADD HL, BC
  RET

;показываем 1 тайл на карте
;HL - указатель на спрайт
;DE - экранный адрес
show_tile_on_map:
   PUSH DE
 ; // thanks to Alone Coder!
   LD BC,#0808
   ;LD C,0 ; 0E 00
_my_spr_loop_1:
   LDI ; LD (DE),(HL)  DE+1, HL+1, BC-1
   LD A,(HL)
   LD (DE),A
   DEC E
   INC D
   INC HL
   DJNZ _my_spr_loop_1

   POP DE
   PUSH DE

   LD BC, 32
   EX HL, DE
   ADD HL, BC
   EX HL, DE; DE = DE + 32

   LD BC,#0808
_my_spr_loop_2:
     LDI ; LD (DE),(HL)  DE+1, HL+1
     LD A,(HL)
     LD (DE),A
     DEC E
     INC D
     INC HL
     DJNZ _my_spr_loop_2

     POP DE; // original screen position

     PUSH HL
     call math.addr_to_attr
     LDI
     LDI
     POP HL
     LD A,E
     ADD A,30; нижний ряд ( 30 а не 32 так как 2 уже прибавили выше )
     LD E,A
     LDI
     LDI
     RET

; LDI - ED

 ; по текущему адресу тайла на экране получаем адрес тайла справа от него
 ; в DE - адрес тайла на экране
 ; на выходе в DE адрес следующего справа тайла на экране
 MACRO Tiles16.NEXT_TILE_POS_RIGHT
  INC E
  INC E
 ENDM

 MACRO Tiles16.NEXT_TITLE_POS_DOWN
  LD A, #20+#20 ; 64
  ADD A,E
  LD E,A
  JR NC, .next_tile_pos_down_exit
  ; переполнение - значит мы перешли на другую треть, прибавляем 8 к D
  LD E,00
  LD A, #8
  ADD A,D
  LD D,A
.next_tile_pos_down_exit:
  ;LD E,A
; если есть переполнение - значит мы вышли за границу трети экрана, смотрим куда попали
 ENDM

; ; дикий оверхед!!! %)
; ; на входе HL - адрес тайла на карте
; ; на выходе отрисовывать ли спрайт или нет
; check_tile:
;   LD DE, MAP_MASK-MAP_SET; сдвигаем адрес на маску
;   ADD HL, DE
;   LD A, (HL)
;   ret_false
;   ret_true

; программа показывает на экране карту тайлов
; в HL - адрес первого тайла на карте
show_tile_map:

  LD DE, SCREEN_ADDR ; current pos draw variable
  LD B, scrHeight
show_tile_map_loop2: ; цикл по столбцам
  PUSH BC
  PUSH HL; ---- запоминаем все в стек
  PUSH DE

; ------------ рисуем строку тайлов -------------
  LD B, scrWidth
show_tile_map_loop1: ; цикл по строкам
  PUSH BC
  PUSH HL; ---- запоминаем все в стек
  PUSH DE

  LD A,(HL)
  call spr_index_to_addr
  call show_tile_on_map

  POP DE; ---- снимаем все со стека
  Tiles16.NEXT_TILE_POS_RIGHT

  POP HL
  INC HL; сдвигаем указатель на ячейку карты влево
  POP BC
  DJNZ show_tile_map_loop1
; ------------ закончили рисовать строку тайлов -------------

  POP DE
  Tiles16.NEXT_TITLE_POS_DOWN
  POP HL; ---- снимаем все со стека
  LD BC, mapSize
  ADD HL, BC; прибавляем к указателю на начало тайлов ширину - сдвигаем указатель вниз на 1 тайл
  POP BC
  DJNZ show_tile_map_loop2
  RET

; sprArray dw 00 ;EQU p_sprArray+1

  ENDMODULE
