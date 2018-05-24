MODULE items

STRUCT ItemType
spr_num db 00; номер спрайта предмета, должен идти первым 
; чтобы после вызова функции calcItemType 
; можно было получать номер спрайта как LD A, (HL)
; а не через PUSH HL/POP IX/LD A,(IX+ItemType.spr_num)
;--- прочие части
; name_ptr dw 00; не нужно, у нас показывается по name_ptr в спрайте
round db 00; скажем, заряд
weight db 00; скажем, вес
    db 00
; script_ptr dw 00; указатель на скрипт обработки действий
ENDS

STRUCT Item
itemID db 00; номер типа предмета
pos Point 0,0 ; позиция на карте
ground db 00; что оказалось на земле когда бросили предмет
owner db 00; номер героя в инвентаре которого находится предмет, если #ff то лежит на карте
;--- типа заряд :)
rounds db 00;
; parent_ptr dw 0; у кого лежит, если 0000 то лежит на карте, иначе указатель на hero
ENDS

; на входе в A - индекс типа предмета
; на выходе в HL - указатель на массив с данными предмета
calcItemType:
  LD DE, ItemType
  CALL math.mul_ADE
  LD DE, ITEM_TYPES
  ADD HL, DE
  RET

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
    JP Z, Entities.check_yes
    ADD IX, DE
    DJNZ search_empty_item_loop
    JP Entities.check_no

; в DE позиция на карте
; в A - номер предмета
; если в ячейке находится герой, то меняем землю у него на спрайт предмета чтобы он мог корректно уйти =)
add_item_to_map:
    PUSH DE
    PUSH AF
    CALL search_empty_item; на выходе признак переноса и IX указатель на пустой предмет или сброшеный признак переноса
    JR C, add_item_to_map_error
    POP AF
    LD (IX+Item.itemID), A; сохранили тип предмета
    POP DE
    LD (IX+Item.pos.x), D
    LD (IX+Item.pos.y), E ; сохранили позицию предмета
    LD (IX+Item.owner), #ff ; лежит на карте 
    PUSH IX
    POP IY; сохраняем в IY указатель на предмет
    CALL Entities.find_char_on_map ; проверяем стоит ли на этой ячейке какой-либо герой
    JR NC, add_item_to_hero_ground_spr ; герой есть, переходим 
add_item_to_map_spr:; героя нет, размещаем просто на карте
    ; надо закинуть спрайт предмета на карту и взять ground с нее
    CALL map.calc_pos ; в HL указатель на ячейку
    LD A, (HL) ; забрали "землю"
    LD (IY+Item.ground), A
    PUSH HL
    LD A, (IY+Item.itemID); взяли тип предмета
    CALL calcItemType
    LD A, (HL) ; (IX+ItemType.spr_num)
    POP HL
    LD (HL),A
    JP Entities.check_yes
add_item_to_hero_ground_spr:
; мы добавляем предмет на пол, а на полу стоит герой, ставим ему на пол спрайт
; у нас в IY указатель на предмет
; в IX указатель на героя
    LD A, (IY+Item.itemID); взяли тип предмета
    CALL calcItemType; в HL указатель на предмет
    LD A, (HL); забрали номер спрайта
    LD B, (IX+Entities.Hero.ground)
    LD (IX+Entities.Hero.ground), A; поместили спрайт на землю у героя
    LD (IY+Item.ground),B
    JP Entities.check_yes
add_item_to_map_error:
    POP AF
    POP DE
    JP Entities.check_no

; герой подбирает предмет с карты
; на входе в IY указатель на персонажа, Entities.CurPersonageNum - текущий номер персонажа ( помечаются им предметы )
; на входе в IX указатель на предмет
; на входе в IY + Entities.Hero.sprite - спрайт героя с предметом в руках
pick_up_item:

    LD A, (Entities.CurPersonageNum)
    LD (IX+Item.owner), A; пометили предмет как принадлежащий текущему герою

    LD A, (IX+Item.ground) ; земля предмета
    LD (IY+Entities.Hero.ground), A; записываем землю предмета в землю героя, поэтому как только он сойдет с клетки,
                          ; на старом месте появится не спрайт предмета а его земля
    PUSH IX
    POP HL
    LD (IY+Entities.Hero.hand_right_p), HL

upd_hero_map: ; обновляем спрайт героя на карте
    LD DE, (IY+Entities.Hero.pos)
    CALL map.calc_pos
    LD A, (IY+Entities.Hero.sprite)
    LD (HL), A
    RET

; герой бросает предмет из рук на карту
; на входе в IY указатель на персонажа, Entities.CurPersonageNum - текущий номер персонажа ( помечаются им предметы )
; на входе в IX указатель на предмет
; на входе в IY + Entities.Hero.sprite - спрайт героя без предмета
drop_down_item:

    LD (IY+Entities.Hero.hand_right_p), 0; освободили руку героя
    LD (IX+Item.owner), #ff; пометили предмет как свободный
    LD DE, (IY+Entities.Hero.pos)
    LD (IX+Item.pos), DE ; помещаем предмет на позицию героя

    LD A, (IY+Entities.Hero.ground); читаем землю героя
    LD (IX+Item.ground), A ; пишем в землю предмета

    LD A, (IX+Item.itemID) ; берем id предмета
    CALL calcItemType
    LD A, (HL) ; в HL указатель на тип предмета, первый байт - номер спрайта
    LD (IY+Entities.Hero.ground), A

    JR upd_hero_map

; в IX указатель на предмет в массиве предметов
remove_item_to_map:
    LD ( IX+Item.itemID ), #ff; удалили :D
    LD D, (IX+Item.pos.x)
    LD E, (IX+Item.pos.y)
    CALL map.calc_pos
    LD A, (IX+Item.ground)
    LD (HL),A
    RET

; в DE позиция на карте
; на выходе если есть на этой позиции хотя бы один предмет, возвращаем NZ
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
    JP Entities.check_yes
next_item:
    PUSH BC
    LD BC, Item
    ADD IX, BC
    POP BC
    DJNZ check_item
    JP Entities.check_no

ENDMODULE