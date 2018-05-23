MODULE items
/*
  MACRO AddItemMap pos_x,pos_y,itemID
    defw items.add_item_map_me
    defb pos_x, pos_y
    defb itemID
  ENDM
*/
STRUCT ItemType
; name_ptr dw 00; указатель на имя типа ( имя не нужно - есть имя спрайта )
spr_num db 00; номер спрайта предмета
;--- прочие части
round db 00; скажем, заряд
weight db 00; скажем, вес
    db 00
; script_ptr dw 00; указатель на скрипт обработки действий
; db weight
ENDS

STRUCT Item
itemID db 00; номер типа предмета
pos Point 0,0 ; позиция на карте
ground db 00; что оказалось на земле когда бросили предмет
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

/*
add_item_map_me:
    mLDE; в DE позиция
    mLDA; в A номер предмета
    PUSH HL
    CALL add_item_to_map
    POP HL
    JP zxengine.process
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
    JP Z, Entities.check_yes
    ADD IX, DE
    DJNZ search_empty_item_loop
    JP Entities.check_no

; в DE позиция на карте
; в A - номер предмета
; TODO: проверить находится ли герой на ячейке, меняем землю у него на спрайт (?)
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
    PUSH HL
    POP IX
    LD A, (IX+ItemType.spr_num)
    POP HL
    LD (HL),A
    JP Entities.check_yes
add_item_to_hero_ground_spr:
; мы добавляем предмет на пол, а на полу стоит герой, ставим ему на пол спрайт
    ; LD A, 
    ; JP Entities.check_no
    di
    halt
add_item_to_map_error:
    POP AF
    POP DE
    JP Entities.check_no

; самодостаточная функция, герой подбирает первый попавшийся предмет с карты
pick_up_item:
    LD IX, (Entities.activePersonage_ptr)
    LD DE, (IX+Entities.Hero.pos)
    CALL find_item_on_map
    JR C, pick_up_item_ret

    LD ( IX+Item.itemID ), #ff; удалили из списка :D
    LD A, (IX+Item.ground) ; земля предмета
    
    LD IY, (Entities.activePersonage_ptr)
    LD (IY+Entities.Hero.ground), A; записываем землю предмета в землю героя, поэтому как только он сойдет с клетки,
                          ; на старом месте появится не спрайт предмета а его земля
pick_up_item_ret:
    RET

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
; на выходе если есть на этой позиции предметы возвращаем NZ
; и IX - указатель на него
find_item_on_map:
    LD IX, ITEM_ARRAY; указатель на массив предметов
    LD B, ItemArraySize; число предметов
; проверяем совпадают ли координаты хотя бы c одним предметом
check_item:
    LD A, (IX+Item.pos.y)
    CP E
    JR NZ, next_item
    LD A, (IX+Item.pos.x)
    CP D
    JR NZ, next_item
    LD A, (IX+Item.itemID)
    CP #FF; пустая запись
    JR Z, next_item
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