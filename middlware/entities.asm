    MODULE Entities

activePersonage_ptr:
  dw #0000 ; указатель на текущего персонажа
RevertPersonageNum:
  db #00 ; инверсный номер персонажа ( от PersonagesNum до 0!!!)
MapCell_xy:
  Point 0,0 ; координаты на карте на которую воздействует персонаж ( заполняется в процедуре charCheckAction )
MapCell_ptr:
  dw #0000 ;указатель на ячейку карты на которую воздействует персонаж ( заполняется в процедуре charCheckAction )

; действия
act_end   EQU 0x00
act_stand EQU 0x01
act_look  EQU 0x02
act_take  EQU 0x03
act_use   EQU 0x04

; тип ячейки на карте или предмета
STRUCT CellType
name_ptr dw 00; указатель на имя типа
script_ptr dw 00; указатель на скрипт обработки действий если нужен, иначе 0000
;--- разные части
;prot db 00; проницаемость для предметов, 00 - полностью проницаем
;force_destr db 00; сила для уничтожения
ENDS

STRUCT Hero
pos Point 0,0 ; позиция на карте
sprite db 00; текущий спрайт
ground db 00; на чем стоит
flags db 00; признаки-флаги
name_p dw #0000
; --- инвентарь
; head db 00
; mask db 00
; left_hand db 00
; righ_hand db 00
; torse db 00
; boot db 00
ENDS

; ------- инициализация на карте всех персонажей из CHAR_SET
initHeroes:
  LD HL, CHARS_SET
PersonagesNum_ptr:
  LD B, PersonagesNum
init_loop; пробегаемся по всем персонажам и размещаем их на карте
  LD DE, Hero
  PUSH BC
  PUSH DE
  PUSH HL
  LD IX,HL

  LD DE, (IX+Hero.pos)
  call map.calc_pos
  LD A,(HL)
  LD (IX+Hero.ground),A; ячейку карты ставим на пол персонажа
  LD A,(IX+Hero.sprite)
  LD (HL),A ; ставим спрайт персонажа на карту
  POP HL
  POP DE
  POP BC
  ADD HL, DE
  DJNZ init_loop
  JP firstChar

; ------- циклический переход на следующего героя ( если был последний то на первого )
loopNextChar:
  CALL nextChar
  RET NZ
firstChar:
  LD DE, CHARS_SET
  ld (activePersonage_ptr), DE
  LD A, PersonagesNum
  LD (RevertPersonageNum), A
  RET

; ------- переход на следующего героя
; на выходе если у нас признак Z в 1 значит достилги конца массива
nextChar:
  LD A, (RevertPersonageNum)
  DEC A
  RET Z; если у нас обнулился счетчик - возвращаемся
  LD (RevertPersonageNum), A
  LD DE, (activePersonage_ptr)
  LD HL, Hero
  ADD HL, DE
  LD (activePersonage_ptr), HL
  OR 2
  RET

; ------- показать карту с текущим персонажем на экране
lookChar:
  LD IX, (activePersonage_ptr)
  LD DE, (IX+Hero.pos)
  CALL map.center_map
  JP Tiles16.show_tile_map
  RET

; ------- двигаем персонажа вверх
charMoveUp:
  LD B, act_stand; встаем на ячейку
  LD A, dir_up
  CALL charCheckAction
  RET C; нельзя двигаться никак

; ------- двигаем персонажа на позицию MapCell_xy ( MapCell_ptr )
char_to_map_moved:
  ;CALL pesr_floor_to_ground; вместо этого - процедура ниже
  LD IX, (activePersonage_ptr);
  LD DE, (IX+Hero.pos) ;
  CALL map.calc_pos    ; определяем координаты позиции персонажа в HL
  LD A,(IX+Hero.ground);
  LD (HL),A            ; и ставим на карту спрайт пола
  LD DE, ( MapCell_xy )
  LD (IX+Hero.pos), DE
  ;call ground_to_pers_floor; вместо этого - процедура ниже
  LD HL,( MapCell_ptr )
  LD A,(HL)
  LD (IX+Hero.ground),A; ячейку карты ставим на пол персонажа
  LD A,(IX+Hero.sprite)
  LD (HL),A ; ставим спрайт персонажа на карту
  RET

  ; двигаем персонажа вниз
charMoveDown:
  LD B, act_stand; встаем на ячейку
  LD A, dir_down
  CALL charCheckAction
  RET C; нельзя двигаться никак
  JR char_to_map_moved;

;двигаем персонажа влево
charMoveLeft:
  LD B, act_stand; встаем на ячейку
  LD A, dir_left
  CALL charCheckAction
  RET C; нельзя двигаться никак
  JR char_to_map_moved;

charMoveRight:
  LD B, act_stand; встаем на ячейку
  LD A, dir_right
  CALL charCheckAction
  RET C; нельзя двигаться никак
  JR char_to_map_moved;

charCheckAction:

charCheck_yes:
  SCF ; устанавливаем бит переноса и инвертируем его ))
  CCF
  RET
charCheck_no:
  SCF
  RET


    ENDMODULE
