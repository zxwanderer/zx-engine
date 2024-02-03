MODULE Entities

  MACRO SetMapCell value_p
    defw Entities.set_map_cell_me
    defb value_p
  ENDM

  MACRO SetMapCellOnHero value_p
    defw Entities.set_map_cell_on_hero_me
    defb value_p
  ENDM

; одеваем ячейку карты на героя - item_id то что становится на герое,
; cell_id - что становится на земле вместо надетой вещи
; пока будет так потом надо где-то хранить "исходный" спрайт игрока чтобы
; автоматом его возвращать, но потом 
; "Снять" здесь нет, просто одеваем спрайт игрока без скафандра )
  MACRO WearItem item_, cell_
    defw Entities.wear_item_me
    defb cell_
    defb item_
  ENDM

  ; ; в var_ret возвращаем спрайт в который одет герой
  MACRO GetWearItem
    defw Entities.get_wear_item_me
  ENDM

; для корректного вызова скрипта обработки предмета 
; нужно знать откуда брать его id - 
;       предмет может быть в руках персонажа
;       предмет может лежать на карте
;       или это может быть просто ячейка карты
; поэтому все это придется закодировать в CharDo
; а все богатство возможных последствий придется закодировать в 
; скриптах

  MACRO CharRotMove dir_p
    defw Entities.char_rot_move_me
    defb dir_p
  ENDM

  MACRO CharDoDir action_p
    defw Entities.char_do_dir_me
    defb action_p
  ENDM

  ; MACRO CharDo action_p, dir_p
  ;   defw Entities.char_do_me
  ;   defb dir_p
  ;   defb action_p
  ; ENDM

  ; MACRO CharDoForward dir_p
  ;   defw Entities.char_do_forward_me
  ;   defb dir_p
  ; ENDM

  ; MACRO CharRotLeft
  ;   defw Entities.char_rot_left_me
  ; ENDM

  ; MACRO CharRotRight
  ;   defw Entities.char_rot_right_me
  ; ENDM

activePersonage_ptr:
  dw #0000 ; указатель на текущего персонажа
CurPersonageNum:
  db #00 ; текущий номер персонажа ( от 0 до PersonagesNum )
MapCell_ptr:
  dw #0000 ;указатель на ячейку карты на которую воздействует персонаж ( заполняется в процедуре charCheckAction )
ActiveItem_ptr:
  dw #0000 ; указатель на используемый предмет
ActiveItem_ptr_ground:
  dw #0000 ; указатель на используемый предмет на земле
; ActiveItemType_ptr:
  ; dw #0000 ; указатель на тип используемого предмета

char_rot_move_me:
  mLDB
  PUSH HL
  CALL char_rot_move
  POP HL
  JP zxengine.process

; char_do_me:
;   mLBC
;   PUSH HL
;   CALL char_do
;   POP HL
;   JP zxengine.process

char_do_dir_me:
  mLDB
  PUSH HL
  CALL char_do_dir
  POP HL
  JP zxengine.process

; char_do_forward_me:
;   mLDB
;   PUSH HL
;   LD IX, (activePersonage_ptr)
;   ; CALL char_do
;   LD C, (IX+Hero.dir)
;   CALL char_do
;   POP HL
;   JP zxengine.process

wear_item_me:
  mLBC
  PUSH HL
  CALL wear_item
  ; CALL Entities.lookChar
  POP HL
  JP zxengine.process

; на входе в B - что одеваем
; , C - что остается на земле
wear_item
  PUSH BC
  PUSH BC
  LD A, C
  CALL set_map_cell
  POP BC
  LD IX, (Entities.activePersonage_ptr)
  LD A, B
  LD ( IX + Hero.sprite ), A
  LD ( IX + Hero.base_spr), A
  CALL Entities.lookChar
  POP BC
  LD A, B
  CALL set_map_cell
  RET

get_wear_item_me:
  ; INC HL
  PUSH HL
  LD IX, (Entities.activePersonage_ptr)
  LD A, ( IX+Hero.base_spr ) ; запомнили одежду
  setVar Vars.var_ret
  POP HL
  JP zxengine.process

set_map_cell_me:
  mLDA
  PUSH HL
  CALL set_map_cell
  POP HL
  JP zxengine.process 

set_map_cell_on_hero_me
  mLDA
  PUSH HL
  CALL set_map_cell_on_hero
  POP HL
  JP zxengine.process 

; устанавливаем землю под ноги героя
; в A - индекс типа ячейки
set_map_cell_on_hero:
  ; PUSH AF
  LD IX, (Entities.activePersonage_ptr)
  LD (IX+Hero.ground), A
  RET
  ; LD D, (IX+Hero.pos.x)
  ; LD E, (IX+Hero.pos.y)
  ; POP AF
  ; JP set_map_cell_DE

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

; ------- вычислить координаты курсора на экране который указывает на текущего героя
; на выходе в HL позиция на экране где находится наш герой
; calc_hero_cursor_pos:
  ; LD IX, (activePersonage_ptr) 
  ; LD BC, (map.mapPos)
  ; LD A, (IX+Hero.pos.x)
  ; SUB B
  ; LD H,A  
  ; LD A, (IX+Hero.pos.y)
  ; SUB C
  ; LD L,A
  ; RET

; ------- показать информацию о ячейке на которую смотрит персонаж
; TODO на данный момент учитывает только спрайты с карты
lookCharSeeCellInfo:
  LD IX, (activePersonage_ptr)
  LD A, (IX+Hero.dir)
  CALL calc_action_pos; в MapCell_ptr получили указатель на ячейку карты
  RET NC
  LD HL, (MapCell_ptr)
  LD A, (HL)
  CALL calc_cell_type
  LD (lookCharSeeCellInfo_p+1), HL
lookCharSeeCellInfo_p:
  LD HL, (#0000)
  CALL screenfx.show_info_message
  RET

; ------- показать карту с текущим персонажем на экране
lookChar:
  LD IX, (activePersonage_ptr)
  LD D, (IX+Hero.pos.x)
  LD E, (IX+Hero.pos.y)
  LD A, (IX+Hero.dir)
  CALL View.look
  ; CALL map.center_map
  ; CALL View.copy
  JP View.draw
  ; JP Tiles16.show_tile_map
  ; RET

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

; вертим героя в нужном направлении или двигаем если уже смотрим в этом направлении
; в B - направление
char_rot_move:
  LD IX, (activePersonage_ptr)
  LD A, (IX+Hero.dir)
  CP B
  JR NZ, char_not_move
  LD C, A
  LD B, do_stand
  JP char_do
char_not_move:
  LD A, B
  LD (IX+Hero.dir), B
  CALL Entities.lookCharSeeCellInfo
  JP char_update_sprite

; в B - action
char_do_dir:
  LD IX, (activePersonage_ptr)
  LD C, (IX+Hero.dir)
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
; Vars.MapCell_xy - позиция, MapCell_ptr - указатель на ячейку

; подготавливаем переменные для обработки в скриптах
  CALL items.get_hero_hand_item; устанавливаем в Vars.var_item_id id предмета

; проверяем поднимаем мы или бросаем
  getVar Vars.var_act
  CP do_get_drop
  JP NZ, char_do_2; если это не поднятие/бросание то переходим на 2ю фазу

; начинаем высчитывать что это - поднятие или бросание...
; есть ли предмет в руках?
  getVar Vars.var_item_id
  CP #FF
  JR Z, no_item_in_hand

yes_item_in_hand: ; предмет в руках есть - значить бросаем его!
  LD A, do_drop
  setVar Vars.var_act
  JR char_do_2

no_item_in_hand: ; предмета в руках нет - значить поднимаем !
  LD A, do_get
  setVar Vars.var_act

char_do_2:
  ifdef _InteractiveOn_
  LD HL, (MapCell_ptr)
  LD A, (HL)
  CALL call_cell_script
  getVar Vars.var_ret
  OR A
  RET Z; после скрипта переменная установлена в 0 - значит все обработано, по дефолту обрабатывать не нужно
  endif

; -- дефолтная обработка - если хотим встать - становимся,
; -- если хотим бросить - бросаем, если хотим поднять - поднимаем!

  getVar Vars.var_act

  CP do_stand
  JP Z, char_do_stand; персонаж перемещается туда

  CP do_get
  JP Z, char_do_get; подбираем/бросаем

  CP do_drop
  JP Z, char_do_drop; подбираем/бросаем

  ; LD A, 10
  ; CALL FX_SET; обиженно пиликаем 
 
  RET

; -------------------------------------------------------------------
; меняем спрайт героя в зависимости от направления персонажа ( в IX указатель на героя )
; -------------------------------------------------------------------
char_update_sprite:
  LD B,(IX+Hero.base_spr)
  LD A,(IX+Hero.dir)
  ADD A, B
  LD (IX+Hero.sprite), A
  LD D, (IX+Hero.pos.x)
  LD E, (IX+Hero.pos.y)
  CALL map.calc_pos             ; определяем координаты позиции персонажа в HL
  LD A, (IX+Hero.sprite)
  LD (HL),A                     ; ставим спрайт персонажа на карту
  RET

; char_rot_left_me:
;   PUSH HL
;   CALL char_rot_left
;   POP HL
;   JP zxengine.process 

; char_rot_right_me:
;   PUSH HL
;   CALL char_rot_right
;   POP HL
;   JP zxengine.process 

; -------------------------------------------------------------------
; вертим персонажа влево
; -------------------------------------------------------------------
char_rot_left:
  LD IX, (activePersonage_ptr)
  LD A, (IX+Hero.dir)
  DEC A
  JP P, char_rot_no_over
  LD A, dir_down_right
char_rot_no_over:
  LD (IX+Hero.dir), A
  JP char_update_sprite
  RET

; -------------------------------------------------------------------
; вертим персонажа вправо
; -------------------------------------------------------------------
char_rot_right:
  LD IX, (activePersonage_ptr)
  LD A, (IX+Hero.dir)
  INC A
  CP dir_down_right+1
  JR NZ, char_rot_no_over
  XOR A
  JR char_rot_no_over
; char_rot__no_over:  
;   LD (IX+Hero.dir), A
;   JP char_update_sprite
;   RET

; -------------------------------------------------------------------
; персонаж перемещается на MapCell_xy ( MapCell_ptr тоже установлен )
; -------------------------------------------------------------------
char_do_stand:

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

  LD A, (IX+Hero.sprite)
  LD (HL),A                     ; ставим спрайт персонажа на карту
  CALL Entities.lookCharSeeCellInfo
  RET

; ; ------------------------------------------------------------------------------------
; ; персонаж поднимает предмет или бросает на MapCell_xy ( MapCell_ptr тоже установлен )
; ; ------------------------------------------------------------------------------------
; char_do_get_drop:
; ; сначала определяем есть ли предметы

;   ; CALL items.get_hero_hand_item; получаем предмет в руках
;   ; JR C, char_do_use; если руки не свободны - переходим на использование предмета

; char_do_drop:
; ------------------------------------------------------------------------------------
; персонаж использует ячейку MapCell_xy ( MapCell_ptr тоже установлен )
; ------------------------------------------------------------------------------------

; бросаем предмет из рук на пол ( предмет в руках есть )
char_do_drop:
  LD IY, (Entities.activePersonage_ptr)
  LD L, (IY+Hero.hand_right_p)
  LD H, (IY+Hero.hand_right_p+1); 
  PUSH HL
  POP IY; запоминаем в IY указатель на предмет в руках

  LD DE, (Vars.MapCell_xy)
  CALL items.find_item_on_map
  JP NC, drop_on_ground; бросаем прямо на пол

drop_on_item: ;бросаем на другой предмет, в IX - указатель на него  
  LD A, (IX+Item.ground); берем землю из найденного предмета
  LD (IY+Item.ground), A; запоминаем в своем
  JP drop_end

drop_on_ground: ; в IY - предмет в руках
  LD HL, ( MapCell_ptr )
  LD A, (HL)
  LD (IY+Item.ground), A
  
drop_end:
  LD A, #ff
  LD (IY+Item.owner), A
  LD DE, (Vars.MapCell_xy)
  
  LD (IY+Item.pos.x), D
  LD (IY+Item.pos.y), E

  getVar Vars.var_item_id
  LD HL, ( MapCell_ptr )
  LD (HL), A
  XOR A
  LD IY, (Entities.activePersonage_ptr)
  LD (IY+Hero.hand_right_p), A
  LD (IY+Hero.hand_right_p+1), A 
  JP action_drop

; поднимаем предмет с пола!
char_do_get:
  LD DE, (Vars.MapCell_xy)
  CALL items.find_item_on_map
  JP NC, action_fault; предмета нет, поднять нельзя.. 
; предмет есть
  LD (ActiveItem_ptr_ground), IX; ix - указатель на предмет
  LD IY, (Entities.activePersonage_ptr) ; iy - указатель на персонажа

  LD A, ( Entities.CurPersonageNum )
  LD (IX+Item.owner), A ; присваиваем ID персонажа предмету

  PUSH IX
  POP HL
  LD (IY+Hero.hand_right_p), L
  LD (IY+Hero.hand_right_p_1), H ; ставим "в руки" персонажа указатель на предмет

  ; есть ли еще предметы? 
  LD DE, (Vars.MapCell_xy)
  CALL items.find_item_on_map
  JP C, get_from_item; поднимали с предмета, который нашли и поместили указатель в IY
get_from_ground: ; поднимали с земли, ставим в IY указатель на поднятый предмет
  LD IY, (ActiveItem_ptr_ground)
  LD A, (IY+Item.ground)
get_end:
  LD HL, ( MapCell_ptr )
  LD (HL), A
  JP action_pickup
get_from_item:
  LD A, (IX+Item.itemID)
  CALL items.calc_item_type
  LD A,(HL)
  JP get_end

action_drop:
  LD A, FX_Drop
  CALL FX_SET
  CALL Entities.lookCharSeeCellInfo
  RET

action_pickup:
  LD A, FX_Pickup
  CALL FX_SET
  CALL Entities.lookCharSeeCellInfo
  RET

action_fault:
  LD A, 10
  CALL FX_SET; обиженно пиликаем
  CALL Entities.lookCharSeeCellInfo
  RET


/*
  CALL items.get_hero_hand_item; получаем предмет в руках
  JR C, char_do_drop; если руки не свободны - переходим на бросок предмета

  ; решили что это поднятие
  LD A, do_get
  setVar Vars.var_act

  ; предмета в руках нет, ищем на карте
  LD DE, (Vars.MapCell_xy)
  CALL items.find_item_on_map
  JR NC, char_no_get; предмета нет !

; char_pickup_item:
  ; в IX указатель на предмет
  LD (ActiveItem_ptr), IX
  LD A, (IX+Item.itemID); взяли номер типа предмета
  
  CALL items.calc_item_type;  получили указатель на описание типа предмета
  LD A, (HL)
  CALL call_cell_script
  getVar Vars.var_ret
  OR A
  RET Z; после скрипта переменная установлена в 0 - ошибка поднятия

  ; LD (IY+Hero.hand_right_p_1), 00; предмет брошен
; char_pickup_item_no_call:
  LD IY, (Entities.ActiveItem_ptr);
  PUSH IY
  POP HL

  LD IX, (Entities.activePersonage_ptr)
  LD (IX+Hero.hand_right_p), L
  LD (IX+Hero.hand_right_p_1), H

  LD A, ( CurPersonageNum )
  LD (IY+Item.owner), A

  CALL items.push_item_from_map

  LD A, FX_Pickup
  CALL FX_SET

  RET

char_no_get:

  LD HL, ( MapCell_ptr )
  LD A, ( HL )
  
  CALL call_cell_script

  getVar Vars.var_ret; проверяем если нет ошибки поднятия - возврат
  OR A
  RET Z

; char_no_get_no_char:
  LD A, 10
  CALL FX_SET; обиженно пиликаем
  RET

char_do_drop:
  ; тут у нас в A номер спрайта, в HL - указатель на описание типа предмета
  PUSH AF
  LD A, do_drop
  setVar Vars.var_act
  POP AF

  LD HL, ( MapCell_ptr )
  LD A, ( HL )
  CALL call_cell_script
  getVar Vars.var_ret; проверяем если нет ошибки поднятия - возврат
  OR A
  RET Z


  LD IY, (activePersonage_ptr)
  LD E, (IY+Hero.hand_right_p)
  LD D, (IY+Hero.hand_right_p_1)
  LD (ActiveItem_ptr), DE; заполняем указатель на активный предмет тем что в руках, так как он может использоваться в скриптах
  CALL call_cell_script ; обрабатываем бросок 
  getVar Vars.var_ret
  OR A
  RET Z; после скрипта переменная установлена в 0 - ошибка бросания
  
  LD IY, (activePersonage_ptr)
  LD (IY+Hero.hand_right_p_1), 00; предмет брошен
  
  ; LD D, (IY+Hero.pos.x)
  ; LD E, (IY+Hero.pos.y); координаты персонажа в DE
  LD DE, ( Vars.MapCell_xy )

  LD IY, (Entities.ActiveItem_ptr);

  LD (IY+Item.pos.x), D
  LD (IY+Item.pos.y), E
  PUSH IY
  CALL items.pop_item_to_map
  POP IY
  LD (IY+Item.owner), #ff; помечаем предмет как брошеный на карту
  
  LD A, FX_Drop
  CALL FX_SET

  RET
*/

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
; иначе в DE и MapCell_xy позиция действия, MapCell_ptr - указатель на ячейку карты
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
  LD (IX+Item.ground), A
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

; set_herow_sprite
;   RET 

ENDMODULE
