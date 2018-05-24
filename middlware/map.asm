    MODULE map

mapPos:
    Point 0,0; координаты верхнего левого спрайта карты для текущего отображения

scrWindowMaxX equ mapSize-scrWidth+1  ; максимальная позиция окна отображения карты, иначе выходим за границу
scrWindowMaxY equ mapSize-scrHeight+1 ; максимальная позиция окна отображения карты, иначе выходим за границу
scrWidthHalf equ scrWidth/2;  8
scrHeightHalf equ scrHeight/2; 6

; На входе координаты ячейки которую хотим поместить в центр вывода на экране
; На выходе: изменяем mapPos
; Вход: DE - pos,  D - x, E - y
center_map:
centr_X:
  LD A,D; проверяем X на минимальность
  SUB scrWidthHalf; вычитаем из A половину ширины экрана
  JR NC, centr_X_max
  LD D, #00; обнуляем X
  JR centr_Y
centr_X_max:
  CP scrWindowMaxX
  JR C,set_x
  LD D, scrWindowMaxX-1
  JR centr_Y
set_x:
  LD D, A
  ;JR centr_Y
centr_Y:
  LD A, E; проверяем X на минимальность
  SUB scrHeightHalf
  JR NC, centr_Y_max
  LD E, #00; обнуляем X
  JP calc_pos
centr_Y_max:
  CP scrWindowMaxY
  JR C,set_y
  LD E, scrWindowMaxY-1
  JP calc_pos
set_y:
  LD E, A
  LD (mapPos),DE

look_at_map:
  LD DE, (mapPos)

; переводим pos в указатель на ячейку в массиве карты
; Вход: DE - pos,  D - x, E - y
; Выход: HL - указатель
calc_pos:
  LD HL, #0000
  PUSH DE
  LD C,D; запоминаем posX в C
  LD A,E
  CP 00
  JR Z, no_mul; если ноль по Y то не будем прибавлять ничего
  LD B,E; кидаем posY в B - по B будет автодекрементный цикл
  LD D,0
  LD E, mapSize
mul_loop
  ADD HL,DE
  DJNZ mul_loop
no_mul
  POP DE
  LD E,D
  LD D,0
  ADD HL,DE; в HL у нас
;mapArray_ptr:
  LD DE, MAP_SET
  ADD HL, DE
  RET; нельзя отказаться от RET здесь!! - эта процедура используется еще для добавления спрайтов на карту!!!

; ; ставим на карту новый спрайт
; ; Вход: DE - pos,  D - x, E - y
; ; A - спрайт
; set_cell:
;   PUSH AF
;   call calc_pos

    ENDMODULE