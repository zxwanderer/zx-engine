
  MACRO SETUP_CELL_TYPE _name, _script
    ORG CELL_TYPES+spr*CellType
    CellType _name, _script
  ENDM

  MACRO SETUP_ITEM_TYPE
    ORG ITEM_TYPES+item*CellType
    ItemType spr, 0, 10
  ENDM
    
; обозначаем номера типов ячеек карты для лучшей адресации например открытие двери - SetActionCell Door_open
Door_half_open equ #12

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

; -- 0 --

Cell_Type_Empty:    CellType Empty_cell_name,    no_script ; 0
; Cell_Type_Wall:     CellType Wall_cell_name,     wall_script ; 1
; Cell_Type_02:        CellType Empty_cell_name,   no_script ; 2
; Cell_Type_02:        CellType Empty_cell_name,   no_script ; 2
; Cell_Type_Door:     CellType Door_cell_name,     door_script ; 2
; Cell_Type_Floor:    CellType Floor_cell_name,    floor_script ; 3
; Cell_Type_03:        CellType Empty_cell_name,   no_script ; 3

; Cell_Type_Computer: CellType Computer_cell_name, computer_on_script ; 4
; Cell_Type_04:        CellType Empty_cell_name,   no_script ; 4
; Cell_Type_Ballon:   CellType Ballon_cell_name,   no_script ; 5
; Cell_Type_05:        CellType Empty_cell_name,   no_script ; 5
; Cell_Type_GridWall: CellType Soft_wall_name,     grid_wall_script ; 6
; Cell_Type_06:        CellType Empty_cell_name,   no_script ; 6
; Cell_Type_07:        CellType Empty_cell_name,   no_script ; 7
; Cell_Type_08:        CellType Empty_cell_name,   no_script ; 8
; Cell_Type_09:        CellType Empty_cell_name,   no_script ; 9
; Cell_Type_Canister: CellType Ballon_cell_name,   no_script ; 7
; Cell_Type_Palm:     CellType Ballon_cell_name,   no_script ; 8
; Cell_Type_Human:    CellType Ballon_cell_name,   no_script ; 9

; Cell_Type_0A:       CellType Ballon_cell_name,  no_script ; A
; Cell_Type_0B:       CellType Ballon_cell_name,  no_script ; B
; Cell_Type_0C:       CellType Ballon_cell_name,  no_script ; C
; Cell_Type_0D:       CellType Ballon_cell_name,  no_script ; D
; Cell_Type_0E:       CellType Ballon_cell_name,  no_script ; E
; Cell_Type_0F:       CellType Ballon_cell_name,  no_script ; F

  DUP CellType*256
    CellType Empty_cell_name, no_way_script
  EDUP

ITEM_TYPES:
  ; Shard_Item_Type
; Shard_Item_Type: 
  ; ItemType Shard_spr, 0, 10
; Shard_Item_Type
  ; ItemType Chair_spr, 0, 10
; Chair_Item_Type: ItemType Chair_spr, 0, 10

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

  DUP Item*100-5
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

; ballon_script:
  ; CallScript action_ring_explode
  ; goto no_way_script

; ----- проверяем дверь

PersonagesNum equ 1

CHARS_SET: ; описываем героев:
; Hero1: Entities.Hero 31,31, 9, 0, 0, tHeroName1, 00
Hero2: Hero 4,21, 9, 0, 0, tHeroName2, 00
