MODULE items

  MACRO AddItemMap pos_x,pos_y,itemID
    defw items.add_item_map_me
    defb pos_x, pos_y
    defb itemID
  ENDM

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

add_item_map_me:
    mLDE; в DE позиция
    mLDA; в A номер предмета
    PUSH HL
    CALL add_item_to_map
    POP HL
    JP zxengine.process

; ищем пустой элемент в массиве предметов
    MACRO search_empty_item
    LD HL, ITEM_ARRAY ; указатель на начало массива предметов
search_empty_item_loop:
    LD A, (HL)
    LD IX, HL
    ENDM

; в DE позиция на карте
; в A - номер предмета  
; add_item_to_array:
;     ; call search
;     LD HL, ITEM_ARRAY ; указатель на начало массива предметов
;     LD IX, HL
;     LD (IX+Item.itemID), A
;     LD (IX+Item.pos.x), D
;     LD (IX+Item.pos.y), E
;     RET

; в DE позиция на карте
; в A - номер предмета
add_item_to_map:
    PUSH DE
    PUSH AF
    search_empty_item; на выходе в IX указатель на пустой предмет
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
    CALL calcItemType
    PUSH HL
    POP IY
    LD A, (IY+ItemType.spr_num)
    POP HL
    LD (HL),A
    RET


ENDMODULE