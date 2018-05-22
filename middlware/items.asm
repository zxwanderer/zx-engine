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
    ; теперь надо закинуть спрайт предмета на карту и взять ground с нее
    CALL map.calc_pos ; в HL указатель на ячейку
    LD A, (HL) ; забрали "землю"
    LD (IX+Item.ground), A
    PUSH HL
    LD A, (IX+Item.itemID); взяли тип предмета
    CALL calcItemType
    PUSH HL
    POP IX
    LD A, (IX+ItemType.spr_num)
    POP HL
    LD (HL),A
    RET
add_item_to_map_error:
    POP AF
    POP DE
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