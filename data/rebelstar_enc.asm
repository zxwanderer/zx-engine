
  MACRO SETUP_CELL_TYPE _name, _script
    ORG CELL_TYPES+spr*CellType
    CellType _name, _script
  ENDM

  MACRO SETUP_ITEM_TYPE
    ORG ITEM_TYPES+item*CellType
    ItemType spr, 0, 10
  ENDM

; обозначаем номера типов ячеек карты для лучшей адресации например открытие двери - SetActionCell Door_open

Ring_expl_1 equ #b0
Ring_expl_2 equ #b1
Ring_expl_3 equ #b2
Ring_expl_4 equ #b3

Hero_hand_item_spr: equ #0B
Hero_hand_empty: equ #09
Hero_dead: equ #0A

FX_Nope equ 53
FX_Drop equ 5
FX_Pickup equ 4
FX_Poweroff equ 36
FX_Computer equ 55
FX_Yeah equ 56
FX_No equ 10

FX_Boom equ 21
FX_Wall equ 51
FX_Cutt equ 7
FX_Cutt1 equ 8

CELL_TYPES:
  DUP CellType*256
    CellType Empty_cell_name, no_way_script
  EDUP

ITEM_TYPES:
  DUP ItemType*100
    defb 00
   EDUP 

ITEM_ARRAY:

; Chair_1: Item Chair.item, 5,7, Floor, #ff, 00
; Chair_2: Item Chair.item, 5,11, Floor, #ff, 00
; Chair_3: Item Chair.item, 5,15, Floor, #ff, 00
; Chair_4: Item Chair.item, 5,19, Floor, #ff, 00
; Shard_1: items.Item Shard_Item, 5,23, Floor, #ff, 00
Chair_5: Item Chair.item, 5,23, Floor.spr, #ff, 00

  DUP Item*100
    defb #ff; item.itemID = #ff - признак того что предмета нет 
   EDUP

ItemArraySize equ 100; максимальное число предметов 

no_way_script: ; неуспех 
  SetVar Vars.var_ret, 0
no_script:  ;  никак не нужно обрабатывать коллизию с сущностью
  defb _endByte

; сигнал о получении приходит только после 
; НАЗАД и открыть аккаунт по-новой

action_ring_explode:
  FxActionCell Ring_expl_1
  wait_halt 3
  FxActionCell Ring_expl_2
  wait_halt 3
  FxActionCell Ring_expl_3
  wait_halt 3
  FxActionCell Ring_expl_4
  wait_halt 3
  FxActionCell Ring_expl_3
  wait_halt 1
  FxActionCell Ring_expl_2
  wait_halt 1
  FxActionCell Ring_expl_1
  wait_halt 1
  defb _endByte

; ----- проверяем дверь

PersonagesNum equ 1

CHARS_SET: ; описываем героев:
; Hero1: Entities.Hero 31,31, 9, 0, 0, tHeroName1, 00
Hero2: Hero 4,21, 9, 0, 0, tHeroName2, 00
