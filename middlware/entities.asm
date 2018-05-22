    MODULE Entities

  MACRO SetActionCell value_p
    defw Entities.set_action_cell_me
    defb value_p
  ENDM

  MACRO CharDo action_p, dir_p
    defw Entities.char_action_me
    defb action_p
    defb dir_p
  ENDM

activePersonage_ptr:
  dw #0000 ; указатель на текущего персонажа
RevertPersonageNum:
  db #00 ; инверсный номер персонажа ( от PersonagesNum до 0!!!)
MapCell_ptr:
  dw #0000 ;указатель на ячейку карты на которую воздействует персонаж ( заполняется в процедуре charCheckAction )

MapCell_xy:
  Point 0,0 ; координаты на карте на которую воздействует персонаж ( заполняется в процедуре charCheckAction )

; действия
actions.act_end   EQU 0x00
do_stand EQU 0x01
do_look  EQU 0x02
do_take  EQU 0x03
do_use   EQU 0x04
do_smach EQU 0x05

; тип ячейки на карте или предмета
STRUCT CellType
name_ptr dw 00; указатель на имя типа
script_ptr dw 00; указатель на скрипт обработки действий
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

; на входе в A - индекс типа ячейки
; на выходе - указатель на массив с ячейкой
calcCellType:
  LD DE, CellType
  CALL math.mul_ADE
  LD DE, CELL_TYPES
  ADD HL, DE
  RET

; ------- инициализация на карте всех персонажей из CHAR_SET
initHeroes:
  LD HL, CHARS_SET
PersonagesNum_ptr:
  LD B, PersonagesNum
init_loop: ; пробегаемся по всем персонажам и размещаем их на карте
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

; ----- персонаж на что-то воздействует
char_action_me:
  mLDA
  LD B,A
  mLDA
  PUSH HL
  CALL charCheckAction
  JR C, char_action_me_end; проверили - переносить не нужно - возврат 
  CALL char_to_map_moved
char_action_me_end:
  POP HL
  JP zxengine.process

; ------- двигаем персонажа на позицию MapCell_xy ( MapCell_ptr )
char_to_map_moved:
  LD IX, (activePersonage_ptr)  ;
  LD DE, (IX+Hero.pos)          ;
  CALL map.calc_pos             ; определяем координаты позиции персонажа в HL
  LD A,(IX+Hero.ground)         ;
  LD (HL),A                     ; и ставим на карту спрайт пола
  LD DE, ( MapCell_xy )
  LD (IX+Hero.pos), DE
  LD HL,( MapCell_ptr )
  LD A,(HL)
  LD (IX+Hero.ground),A         ; ячейку карты ставим на пол персонажа
  LD A,(IX+Hero.sprite)
  LD (HL),A                     ; ставим спрайт персонажа на карту
  RET


  MACRO m_check_left:
    LD A,D
    DEC A
    JP M, check_no
    LD D,A
  ENDM

  MACRO m_check_right:
    LD A,D
    INC A
    CP mapSize
    JR NC, check_no
    LD D,A
  ENDM

  MACRO m_check_up:
    LD A,E
    DEC A
    JP M, check_no
    LD E,A
  ENDM

  MACRO m_check_down:
    LD A,E
    INC A
    CP mapSize
    JP NC, check_no
    LD E,A
  ENDM

; Проверяем как персонаж выполняет скриптовое действие
; На входе: 
;   в B - действие
;   в A - направление
; На выходе: если установлен флаг SCF то переносить персонажа
; на активируемую ячейку не нужно =)
charCheckAction:
  LD IX, (activePersonage_ptr)
  LD DE, (IX+Hero.pos);  D - x, E - y
  CP dir_up
  JR Z, check_up
  CP dir_down
  JR Z, check_down
  CP dir_left
  JR Z, check_left
  CP dir_right
  JR Z, check_right

  CP dir_down_left
  JR Z, check_down_left
  CP dir_down_right
  JR Z, check_down_right
  CP dir_up_left
  JR Z, check_up_left
  CP dir_up_right
  JR Z, check_up_right

  JP check_no; фигня какая-то

check_down_left:
  m_check_down
  m_check_left
  JR check_action

check_down_right:
  m_check_down
  m_check_right
  JR check_action

check_up_left:
  m_check_up
  m_check_left
  JR check_action

check_up_right:
  m_check_up
  m_check_right
  JR check_action

check_up:
  m_check_up
  JR check_action

check_down:
  m_check_down
  JR check_action

check_left:
  m_check_left
  JR check_action

check_right:
  m_check_right

; -- перед этим проверили на выходы за границы
check_action: ; в DE у нас координаты ячейки на которую воздействует персонаж
  LD A,B
  setVar zxengine.act_var, A; запоминаем в системной переменной действие
  LD A, 1
  setVar zxengine.ret_var, A; запоминаем в системной переменной действие
  LD ( MapCell_xy ), DE
  call map.calc_pos ; получаем указатель на ячейку карты в HL
  LD ( MapCell_ptr), HL
  LD A, (HL);  и берем оттуда индекс !
  CALL calcCellType
  LD IY, HL
  LD HL, (IY+CellType.script_ptr)
  CALL zxengine.process
  getVar A, zxengine.ret_var
  OR A
  JR Z, check_no
check_yes:
  SCF ; устанавливаем бит переноса и инвертируем его ))
  CCF
  RET
check_no:
  SCF
  RET

set_action_cell_me:
  mLDA
  PUSH HL
  CALL set_action_cell
  POP HL
  JP zxengine.process

; -- устанавливаем новое значение ячейки на карте по адресу MapCell_ptr
set_action_cell:
  LD HL, (MapCell_ptr)
  LD (HL), A
  RET

    ENDMODULE
