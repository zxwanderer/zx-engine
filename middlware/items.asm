MODULE items

; на входе в A - индекс типа предмета
; на выходе в HL - указатель на массив с данными предмета
calc_item_type:
  LD DE, ItemType
  CALL math.mul_ADE
  LD DE, ITEM_TYPES
  ADD HL, DE
  RET

/*
вариант - не надо ничего размещать на карте через процедуру,
на карте их спрайты уже есть, а в массиве предметов хранитмся и в том числе что было под ними на "земле"
*/

; ищем пустой элемент в массиве предметов
; на выходе - если признак переноса есть то предмет можно положить
; иначе в IX указатель на предмет
search_empty_item:
    LD IX, ITEM_ARRAY ; указатель на начало массива предметов
    LD DE, Item; размерность
    LD B, ItemArraySize; максимальное число предметов
search_empty_item_loop:
    LD A, (IX+Item.itemID)
    CP #FF
    JP Z, Entities.sys_check_yes
    ADD IX, DE
    DJNZ search_empty_item_loop
    ret_false

; пробуем манипулировать предметом
; на входе
;   в ActiveItem_ptr указатель на предмет
; предмет уже принадлежит герою ( Item.owner ) поэтому в функциях поиска find_item_on_map он не принимает участие
push_item_from_map: ;"забираем" предмет с карты
    LD IY, (Entities.ActiveItem_ptr)
    ; LD D, (IY+Item.pos.x)
    ; LD E, (IY+Item.pos.y); в DE - текущая позиция 
    LD DE, (Vars.MapCell_xy)

; смотрим есть ли на этой ячейке карты предметы ?
    CALL find_item_on_map
    JR NC, push_item_from_map_no_items
    ; в IX указатель на найденный предмет
    LD A, (IX+Item.itemID)
    CALL calc_item_type
    LD A, (HL) ; в A получили номер спрайта предмета 

push_item_from_map_find_heroes:
    PUSH AF; запомнили его
    ; LD D, (IY+Item.pos.x)
    ; LD E, (IY+Item.pos.y); в DE - текущая позиция 
    LD DE, (Vars.MapCell_xy)
    CALL Entities.is_char_on_map
    JR NC, push_item_from_map_no_heroes
    POP AF; взяли номер спрайта предмета 
    LD (IX+Hero.ground), A
    RET

push_item_from_map_no_heroes:
    ; в DE у нас осталась текущая позиция
    CALL map.calc_pos
    POP AF; сняли со стека номер спрайта
    LD (HL), A
    RET

push_item_from_map_no_items: ; на карте нет предметов
; в IY у нас указатель на активный предмет
    LD A, (IY+Item.ground)
    JR push_item_from_map_find_heroes

; пробуем манипулировать предметом - кладем предмет на карту ( без проверок уже )
; на входе 
; в ActiveItem_ptr указатель на предмет с установленными pos x,y
pop_item_to_map: ; "кладем" предмет на карту
    LD IY, (Entities.ActiveItem_ptr)
    LD D, (IY+Item.pos.x)
    LD E, (IY+Item.pos.y); в DE - текущая позиция
    ; LD DE, (Vars.MapCell_xy)
    CALL find_item_on_map
    JR NC, pop_item_to_map_no_items

    LD A, (IX+Item.ground); берем землю из найденного предмета
    LD (IY+Item.ground), A; запоминаем в своем

    CALL Entities.is_char_on_map
    JR C, pop_item_to_map_set_chars

    CALL map.calc_pos
    JR pop_item_to_map_set_ground

pop_item_to_map_no_items:
    CALL Entities.is_char_on_map
    JR NC, pop_item_to_map_no_heroes

    LD A,(IX+Hero.ground); взяли землю героя ( так как предметов тут нет )
    LD (IY+Item.ground), A; запоминаем землю в своем предмете 

pop_item_to_map_set_chars:
    LD A, (IY+Item.itemID); взяли тип предмета
    CALL calc_item_type; в HL указатель на предмет
    LD A, (HL); забрали номер спрайта
    LD (IX+Hero.ground), A; поместили спрайт на землю у героя
    RET

pop_item_to_map_no_heroes: ; героев нет
    ; в DE у нас сохранилось pox XY
    CALL map.calc_pos ; в HL указатель на ячейку
    LD A, (HL) ; забрали "землю"
    LD (IY+Item.ground), A

pop_item_to_map_set_ground:
    PUSH HL; запомнили указатель на ячейку карты
    LD A, (IY+Item.itemID); взяли тип предмета
    CALL calc_item_type
    LD A, (HL) ; (IX+ItemType.spr_num)
    POP HL
    LD (HL),A
    RET

; внезапно добавляем предмет на карту 
; в DE позиция на карте
; в A - тип предмета
; на выходе в IX указатель на предмет
add_item_to_map:
    PUSH DE
    PUSH AF
    CALL search_empty_item; на выходе признак переноса и IX указатель на пустой предмет или сброшеный признак переноса
    JP NC, add_item_to_map_error
    POP AF
    LD (IX+Item.itemID), A; сохранили тип предмета
    POP DE
    LD (IX+Item.pos.x), D
    LD (IX+Item.pos.y), E ; сохранили позицию предмета
    LD (IX+Item.owner), #fe ;  временно маркируем предмет как занятый 
    LD (Entities.ActiveItem_ptr), IX
    PUSH IX
    CALL pop_item_to_map
    POP IX
    LD (IX+Item.owner), #ff ;положили на карту
    ret_true
add_item_to_map_error:
    POP AF
    POP DE
    ret_false

; получить указатель на предмет в руках героя
; если NC то предмет есть, в A - номер спрайта, в HL указатель на тип предмета
; если предмета нет то в Vars.var_item_id стоит #ff
get_hero_hand_item:
    LD IX, (Entities.activePersonage_ptr)
    LD A, (IX+Hero.hand_right_p_1)
    AND A
    JR NZ, get_hero_hand_item_yes
    LD A, #ff
    setVar Vars.var_item_id
    JP Entities.sys_check_no
get_hero_hand_item_yes:
    LD L, (IX+Hero.hand_right_p)
    LD H, (IX+Hero.hand_right_p+1)
    LD A, (HL)
    CALL items.calc_item_type
    LD A,(HL)
    setVar Vars.var_item_id
    ret_true

; в DE позиция на карте
; на выходе если есть на этой позиции хотя бы один предмет, возвращаем true
; и IX - указатель на него
find_item_on_map:
    LD IX, ITEM_ARRAY; указатель на массив предметов
    LD B, ItemArraySize; число предметов
; проверяем совпадают ли координаты хотя бы c одним предметом
check_item:
    LD A, (IX+Item.itemID)
    CP #FF; пустая запись
    JR Z, next_item
    LD A, (IX+Item.owner)
    CP #FF
    JR NZ, next_item; значение не #ff - лежит у кого-то в инвентаре
    LD A, (IX+Item.pos.y)
    CP E
    JR NZ, next_item
    LD A, (IX+Item.pos.x)
    CP D
    JR NZ, next_item
; нашли!
    ret_true
next_item:
    PUSH BC
    LD BC, Item
    ADD IX, BC
    POP BC
    DJNZ check_item
    ret_false

del_item_from_hand:
  LD IX, (Entities.activePersonage_ptr)
  LD A, (IX+Hero.hand_right_p_1)
  AND A
  RET Z
  LD D,A
  LD E, (IX+Hero.hand_right_p)
  LD (IX+Hero.hand_right_p_1),0
  PUSH DE
  POP IY
  LD (IY+Item.itemID), #ff
  RET

; del_all_items_from_cell:

; создаем предмет прямо в руках героя
; в A - тип предмета
; на выходе в IX указатель на предмет
add_item_to_hand:
;   PUSH AF
  LD ( add_item_to_hand_2+1), A
  CALL search_empty_item; на выходе признак переноса и IX указатель на пустой предмет или сброшеный признак переноса
  RET NC
;   POP AF
add_item_to_hand_2:
  LD A, #00
  LD (IX+Item.itemID), A; сохранили тип предмета
  
  LD A, ( Entities.CurPersonageNum )
  LD (IX+Item.owner), A
  PUSH IX
  POP HL

  LD IX, (Entities.activePersonage_ptr)
  LD (IX+Hero.hand_right_p), L
  LD (IX+Hero.hand_right_p_1), H
  RET

; add_item_to_hand_error:
    ; POP AF
    ; RET

; уничтожаем предмет в активной ячейке
self_destroy_item:
    LD DE, (Vars.MapCell_xy);
; TODO в силу (временных?) ограничений движка предмет на предмет класть не можем,
; поэтому удаляем первый найденный предмет с карты 
; в DE позиция на карте
; на выходе если есть на этой позиции хотя бы один предмет, возвращаем true
; TODO "ЗЕМЛЮ" на карте не восстанавливаем (!!!!)
del_item_from_map:
  CALL find_item_on_map
  RET NC ; предмета и так нет
  LD (IX+Item.itemID), #ff
  ret_true

ENDMODULE