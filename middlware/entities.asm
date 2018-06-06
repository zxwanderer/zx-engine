MODULE Entities

  MACRO SetMapCell value_p
    defw Entities.set_map_cell_me
    defb value_p
  ENDM

; для корректного вызова скрипта обработки предмета 
; нужно знать откуда брать его id - 
;       предмет может быть в руках персонажа
;       предмет может лежать на карте
;       или это может быть просто ячейка карты
; поэтому все это придется закодировать в CharDo
; а все богатство возможных последствий придется закодировать в 
; скриптах

  MACRO CharDo action_p, dir_p
    defw Entities.char_do_me
    defb dir_p
    defb action_p
  ENDM

activePersonage_ptr:
  dw #0000 ; указатель на текущего персонажа
CurPersonageNum:
  db #00 ; текущий номер персонажа ( от 0 до PersonagesNum )
MapCell_ptr:
  dw #0000 ;указатель на ячейку карты на которую воздействует персонаж ( заполняется в процедуре charCheckAction )
ActiveItem_ptr:
  dw #0000 ; указатель на используемый предмет
; ActiveItemType_ptr:
  ; dw #0000 ; указатель на тип используемого предмета

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
; указатели на предметы в правой и левой руке, hand_right_p_1 00 - в руке пусто
hand_right_p db 00
hand_right_p_1 db 00
; hand_left_p dw 00
; --- одежда
; head dw 00
; mask dw 00
; torse dw 00
; boot dw 00
ENDS

char_do_me:
  mLBC
  PUSH HL
  CALL char_do
  POP HL
  JP zxengine.process

set_map_cell_me:
  mLDA
  PUSH HL
  CALL set_map_cell
  POP HL
  JP zxengine.process 

; на входе в A - индекс типа ячейки
; на выходе - в HL указатель на массив с ячейкой
calc_cell_type:
  LD DE, CellType
  CALL math.mul_ADE
  LD DE, CELL_TYPES
  ADD HL, DE
  RET

; по номеру ячейки вызываем скрипт обработки
; на входе в A - номер ячейки
; на выходе хм.. должен быть результат в Vars.var_ret = 1 то успешно
; .... гадит в HL, IY
call_cell_script:
  CALL calc_cell_type; получили в HL указатель на описание ячейки
  PUSH HL
  POP IY
  LD A, 1
  setVar Vars.var_ret; возвращаем по умолчанию 1
  LD L, (IY+CellType.script_ptr)
  LD H, (IY+CellType.script_ptr+1)
  CALL zxengine.process
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

  PUSH HL
  POP IX

  LD D, (IX+Hero.pos.x)
  LD E, (IX+Hero.pos.y)
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
  XOR A
  LD (CurPersonageNum), A
  RET

; ------- переход на следующего героя
; на выходе если у нас признак Z в 1 значит достилги конца массива
nextChar:
  LD A, (CurPersonageNum)
  INC A
  CP PersonagesNum
  RET Z; если у нас обнулился счетчик - возвращаемся
  LD (CurPersonageNum), A
  LD DE, (activePersonage_ptr)
  LD HL, Hero
  ADD HL, DE
  LD (activePersonage_ptr), HL
  OR 2
  RET

; ------- показать карту с текущим персонажем на экране
lookChar:
  LD IX, (activePersonage_ptr)
  LD D, (IX+Hero.pos.x)
  LD E, (IX+Hero.pos.y)
  CALL map.center_map
  JP Tiles16.show_tile_map
  RET

; найти персонажа по адресу DE
; на выходе 
;  если есть персожан на этой позиции 
;  то установлен признак  NZ
;   и IX - указатель на него
is_char_on_map:
    LD IX, CHARS_SET; указатель на массив чаров
    LD B, PersonagesNum; число чаров
; проверяем совпадают ли координаты
check_char:
    LD A, (IX+Hero.pos.y)
    CP E
    JR NZ, next_char
    LD A, (IX+Hero.pos.x)
    CP D
    JR NZ, next_char
    ; LD A, (IX+Hero.itemID)
    ; CP #FF; пустая запись
    ; JR Z, next_item
; нашли!
    ret_true
next_char:
    PUSH BC
    LD BC, Hero
    ADD IX, BC
    POP BC
    DJNZ check_char
    ; JP Entities.check_no
    ret_false

; ----- текущий персонаж на что-то воздействует ----
; на входе 
; activePersonage_ptr указатель на персонажа
; в B - действие
; в C - направление
; --------------------------------------------------
char_do:
  LD A, B
  setVar Vars.var_act

  LD A,C
  CALL calc_action_pos
  RET NC;  возвратили false - неправильное направление или действие

  getVar Vars.var_act

  CP do_stand
  JR Z, char_do_stand; персонаж стоит

  CP do_get_drop
  JR Z, char_do_get_drop; подбираем/бросаем

  LD A, 1
  CALL FX_SET; обиженно пиликаем 
 
  RET

; -------------------------------------------------------------------
; персонаж перемещается на MapCell_xy ( MapCell_ptr тоже установлен )
; -------------------------------------------------------------------
char_do_stand:

; для начала читаем тип спрайта ячейки карты на которую он пытается переместится
  LD HL, (MapCell_ptr)
  LD A, (HL)
  CALL call_cell_script:
  getVar Vars.var_ret
  OR A
  RET Z; после скрипта переменная установлена в 0 - перемещать не нужно
 
  LD IX, (activePersonage_ptr)
  LD D, (IX+Hero.pos.x)
  LD E, (IX+Hero.pos.y)
  CALL map.calc_pos             ; определяем координаты позиции персонажа в HL
  LD A,(IX+Hero.ground)         ;
  LD (HL),A                     ; и ставим на карту спрайт пола
  LD DE, ( Vars.MapCell_xy )
  LD (IX+Hero.pos.x), D
  LD (IX+Hero.pos.y), E
  LD HL,( MapCell_ptr )
  LD A,(HL)
  LD (IX+Hero.ground),A         ; ячейку карты ставим на пол персонажа
  LD A,(IX+Hero.sprite)
  LD (HL),A                     ; ставим спрайт персонажа на карту

  RET

; ------------------------------------------------------------------------------------
; персонаж поднимает предмет или бросает на MapCell_xy ( MapCell_ptr тоже установлен )
; ------------------------------------------------------------------------------------
char_do_get_drop:
  
  CALL items.get_hero_hand_item; получаем предмет в руках
  JR C, char_do_drop; если руки не свободны - переходим на бросок предмета

  ; решили что это поднятие
  LD A, do_get
  setVar Vars.var_act

  ; предмета в руках нет, ищем на карте
  LD DE, (Vars.MapCell_xy)
  CALL items.find_item_on_map
  JR NC, char_no_get; предмета нет !

  ; в IX указатель на предмет
  LD (ActiveItem_ptr), IX
  LD A, (IX+items.Item.itemID); взяли номер типа предмета
  
  CALL items.calc_item_type;  получили указатель на описание типа предмета
  LD A, (HL)
  CALL call_cell_script
  getVar Vars.var_ret
  OR A
  RET Z; после скрипта переменная установлена в 0 - ошибка поднятия

  LD (IY+Entities.Hero.hand_right_p_1), 00; предмет брошен
  LD IY, (Entities.ActiveItem_ptr);
  PUSH IY
  POP HL
  
  LD IX, (Entities.activePersonage_ptr)
  LD (IX+Hero.hand_right_p), L
  LD (IX+Hero.hand_right_p_1), H

  LD A, ( CurPersonageNum )
  LD (IY+items.Item.owner), A

  JP items.push_item_from_map
  ; RET

char_no_get:
  LD A, 0
  setVar Vars.var_ret ; ставим ошибку поднятия

  LD A, 10
  CALL FX_SET; обиженно пиликаем
  RET

char_do_drop:
  ; тут у нас в A номер спрайта, в HL - указатель на описание типа предмета
  PUSH AF
  LD A, do_drop
  setVar Vars.var_act
  POP AF

  LD IY, (activePersonage_ptr)
  LD E, (IY+Entities.Hero.hand_right_p)
  LD D, (IY+Entities.Hero.hand_right_p_1)
  LD (ActiveItem_ptr), DE; заполняем указатель на активный предмет тем что в руках, так как он может использоваться в скриптах
  CALL call_cell_script
  getVar Vars.var_ret
  OR A
  RET Z; после скрипта переменная установлена в 0 - ошибка бросания
  
  LD IY, (activePersonage_ptr)
  LD (IY+Entities.Hero.hand_right_p_1), 00; предмет брошен
  
  LD D, (IY+Entities.Hero.pos.x)
  LD E, (IY+Entities.Hero.pos.y); координаты персонажа в DE

  LD IY, (Entities.ActiveItem_ptr);

  LD (IY+items.Item.pos.x), D
  LD (IY+items.Item.pos.y), E
  PUSH IY
  CALL items.pop_item_to_map
  POP IY
  LD (IY+items.Item.owner), #ff; помечаем предмет как брошеный на карту
  
  RET

  MACRO m_check_left:
    LD A,D
    DEC A
    JP M, check_act_no
    LD D,A
  ENDM

  MACRO m_check_right:
    LD A,D
    INC A
    CP mapSize
    JR NC, check_act_no
    LD D,A
  ENDM

  MACRO m_check_up:
    LD A,E
    DEC A
    JP M, check_act_no
    LD E,A
  ENDM

  MACRO m_check_down:
    LD A,E
    INC A
    CP mapSize
    JP NC, check_act_no
    LD E,A
  ENDM

; вычисляем ячейку на которую действует персонаж по позиции персонажа и направлению
; на входе 
;       activePersonage_ptr указатель на персонажа
;       A - направление 
; на выходе если NС то ошибка ( выход за пределы карты или непонятное действие)
; иначе в DE и MapCell_xy позиция действия
calc_action_pos:
  LD IX, (activePersonage_ptr)
  LD D, (IX+Hero.pos.x)
  LD E, (IX+Hero.pos.y)

calc_action_pos_de: ; а вдруг кто-нибудь сразу сюда полезет? :)
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

  CP dir_center
  JR Z, check_center

check_act_no:
  ret_false
  
check_down_left:
  m_check_down
  m_check_left
  JR check_act_yes

check_down_right:
  m_check_down
  m_check_right
  JR check_act_yes

check_up_left:
  m_check_up
  m_check_left
  JR check_act_yes

check_up_right:
  m_check_up
  m_check_right
  JR check_act_yes

check_up:
  m_check_up
  JR check_act_yes

check_down:
  m_check_down
  JR check_act_yes

check_left:
  m_check_left
  JR check_act_yes

check_right:
  m_check_right

check_center:
check_act_yes: ; получили в DE новую позицию и в MapCell_ptr указатель на ячейку карты
  LD (Vars.MapCell_xy), DE
  CALL map.calc_pos
  LD (MapCell_ptr), HL
  ret_true

; для переходов JR Z - прям сюда )
sys_check_no:
  ret_false

sys_check_yes:
  ret_true

;
; -- устанавливаем новое значение ячейки на карте по адресу MapCell_xy ( MapCell_ptr <- A )
set_map_cell:
  LD DE, (Vars.MapCell_xy)
set_map_cell_DE:
  setVar Vars.var_item_id; запомнили A
  CALL map.calc_pos
  LD (MapCell_ptr), HL
  CALL items.find_item_on_map ; есть ли на карте предметы?
  JR NC, set_map_cell_no_items

set_map_cell_next_item: ; есть - устанавливаем им всем новую "землю"
  getVar Vars.var_item_id
  LD (IX+items.Item.ground), A
  CALL items.check_item
  JR C, set_map_cell_next_item

  ; героям и просто карте менять ничего не надо
  RET

set_map_cell_no_items: ; предметов нет
; есть ли на карте герои?
  CALL is_char_on_map
  JR NC, set_map
  ; если есть - меняем ему землю
  getVar Vars.var_item_id
  LD (IX+Hero.ground), A
  RET

; и героев нет 
set_map:
  getVar Vars.var_item_id
  LD HL, (MapCell_ptr)
  LD (HL), A
  RET

set_herow_sprite
  RET  


ENDMODULE
