

; обозначаем номера типов ячеек карты для лучшей адресации например открытие двери - SetActionCell Door_open
Door_closed equ #02
Door_half_open equ #12
Door_open equ #22

Floor equ #03

Computer_on equ #04
Computer_off equ #14
Computer_break equ #24

Ring_expl_1 equ #b0
Ring_expl_2 equ #b1
Ring_expl_3 equ #b2
Ring_expl_4 equ #b3

Shard_Item: equ 0
Chair_Item: equ 1

Shard_spr: equ #34
Chair_spr: equ #33

Hero_hand_item_spr: equ #0B
Hero_hand_empty: equ #09
Hero_dead: equ #0A

; ENTITY_TABLE: [action][item1][item2][script_ptr]
; #ff - для любых предметов
CELL_TYPES:

; -- 0 --

Cell_Type_Empty:    Entities.CellType Empty_cell_name,    no_script ; 0
Cell_Type_Wall:     Entities.CellType Wall_cell_name,     no_way_script ; 1
Cell_Type_Door:     Entities.CellType Door_cell_name,     no_script ; 2
Cell_Type_Floor:    Entities.CellType Floor_cell_name,    no_script ; 3
Cell_Type_Computer: Entities.CellType Computer_cell_name, no_script ; 4
Cell_Type_Ballon:   Entities.CellType Ballon_cell_name,   no_script ; 5
Cell_Type_GridWall: Entities.CellType Wall_cell_name,     no_script ; 6
Cell_Type_Canister: Entities.CellType Ballon_cell_name,   no_script ; 7
Cell_Type_Palm:     Entities.CellType Ballon_cell_name,   no_script ; 8
Cell_Type_Human:    Entities.CellType Ballon_cell_name,   no_script ; 9

Cell_Type_0A:        Entities.CellType Ballon_cell_name,  no_script ; A
Cell_Type_0B:        Entities.CellType Ballon_cell_name,  no_script ; B
Cell_Type_0C:        Entities.CellType Ballon_cell_name,  no_script ; C
Cell_Type_0D:        Entities.CellType Ballon_cell_name,  no_script ; D
Cell_Type_0E:        Entities.CellType Ballon_cell_name,  no_script ; E
Cell_Type_0F:        Entities.CellType Ballon_cell_name,  no_script ; F

; -- 01 --

Cell_Type_10:        Entities.CellType Empty_cell_name,   no_script ; 0
Cell_Type_11:        Entities.CellType Empty_cell_name,   no_script ; 1
Cell_Type_12:        Entities.CellType Door_cell_name,    no_script ; 2
Cell_Type_13:        Entities.CellType Empty_cell_name,   no_script ; 3
Cell_Type_Off_Computer: Entities.CellType Computer_cell_name, no_script; 4
Cell_Type_15:        Entities.CellType Empty_cell_name,   no_script ; 5
Cell_Type_16:        Entities.CellType Empty_cell_name,   no_script ; 6
Cell_Type_17:        Entities.CellType Empty_cell_name,   no_script ; 7
Cell_Type_18:        Entities.CellType Empty_cell_name,   no_script ; 8
Cell_Type_19:        Entities.CellType Empty_cell_name,   no_script ; 9
Cell_Type_1A:        Entities.CellType Empty_cell_name,   no_script ; A
Cell_Type_1B:        Entities.CellType Empty_cell_name,   no_script ; B
Cell_Type_1C:        Entities.CellType Empty_cell_name,   no_script ; C
Cell_Type_1D:        Entities.CellType Empty_cell_name,   no_script ; D
Cell_Type_1E:        Entities.CellType Empty_cell_name,   no_script ; E
Cell_Type_1F:        Entities.CellType Empty_cell_name,   no_script ; F

; -- 02 --

Cell_Type_20:        Entities.CellType Empty_cell_name,   no_script ; 0
Cell_Type_21:        Entities.CellType Empty_cell_name,   no_script ; 1
Cell_Type_Door_Open: Entities.CellType Door_cell_name,    no_script ; 2
Cell_Type_23:        Entities.CellType Empty_cell_name,   no_script ; 3
Cell_Type_Computer_Break: Entities.CellType Computer_cell_name, no_script; 4
Cell_Type_25:        Entities.CellType Empty_cell_name,   no_script ; 5
Cell_Type_26:        Entities.CellType Empty_cell_name,   no_script ; 6
Cell_Type_27:        Entities.CellType Empty_cell_name,   no_script ; 7
Cell_Type_28:        Entities.CellType Empty_cell_name,   no_script ; 8
Cell_Type_29:        Entities.CellType Empty_cell_name,   no_script ; 9
Cell_Type_2A:        Entities.CellType Empty_cell_name,   no_script ; A
Cell_Type_2B:        Entities.CellType Empty_cell_name,   no_script ; B
Cell_Type_2C:        Entities.CellType Empty_cell_name,   no_script ; C
Cell_Type_2D:        Entities.CellType Empty_cell_name,   no_script ; D
Cell_Type_2E:        Entities.CellType Empty_cell_name,   no_script ; E
Cell_Type_2F:        Entities.CellType Empty_cell_name,   no_script ; F

; -- 03 --

Cell_Type_30:        Entities.CellType Empty_cell_name,   no_script ; 0
Cell_Type_31:        Entities.CellType Empty_cell_name,   no_script ; 1
Cell_Type_32:        Entities.CellType Empty_cell_name,   no_script ; 2
Cell_Type_33:        Entities.CellType Empty_cell_name,   no_script ; 3
Cell_Type_Shard:     Entities.CellType Shard_item_name,   no_script ; 4
Cell_Type_35:        Entities.CellType Empty_cell_name,   no_script ; 5
Cell_Type_36:        Entities.CellType Empty_cell_name,   no_script ; 6
Cell_Type_37:        Entities.CellType Empty_cell_name,   no_script ; 7
Cell_Type_38:        Entities.CellType Empty_cell_name,   no_script ; 8
Cell_Type_39:        Entities.CellType Empty_cell_name,   no_script ; 9
Cell_Type_3A:        Entities.CellType Empty_cell_name,   no_script ; A
Cell_Type_3B:        Entities.CellType Empty_cell_name,   no_script ; B
Cell_Type_3C:        Entities.CellType Empty_cell_name,   no_script ; C
Cell_Type_3D:        Entities.CellType Empty_cell_name,   no_script ; D
Cell_Type_3E:        Entities.CellType Empty_cell_name,   no_script ; E
Cell_Type_3F:        Entities.CellType Empty_cell_name,   no_script ; F

; -- 04 --

Cell_Type_40:        Entities.CellType Empty_cell_name,   no_script ; 0
Cell_Type_41:        Entities.CellType Empty_cell_name,   no_script ; 1
Cell_Type_42:        Entities.CellType Empty_cell_name,   no_script ; 2
Cell_Type_43:        Entities.CellType Empty_cell_name,   no_script ; 3
Cell_Type_44:        Entities.CellType Empty_cell_name,   no_script ; 4
Cell_Type_45:        Entities.CellType Empty_cell_name,   no_script ; 5
Cell_Type_46:        Entities.CellType Empty_cell_name,   no_script ; 6
Cell_Type_47:        Entities.CellType Empty_cell_name,   no_script ; 7
Cell_Type_48:        Entities.CellType Empty_cell_name,   no_script ; 8
Cell_Type_49:        Entities.CellType Empty_cell_name,   no_script ; 9
Cell_Type_4A:        Entities.CellType Empty_cell_name,   no_script ; A
Cell_Type_4B:        Entities.CellType Empty_cell_name,   no_script ; B
Cell_Type_4C:        Entities.CellType Empty_cell_name,   no_script ; C
Cell_Type_4D:        Entities.CellType Empty_cell_name,   no_script ; D
Cell_Type_4E:        Entities.CellType Empty_cell_name,   no_script ; E
Cell_Type_4F:        Entities.CellType Empty_cell_name,   no_script ; F

  DUP Entities.CellType*256
    Entities.CellType Empty_cell_name,   no_way_script
  EDUP

ITEM_TYPES:

Shard_Item_Type: items.ItemType Shard_spr, 0, 10
Chair_Item_Type: items.ItemType Chair_spr, 0, 10

  DUP items.ItemType*100
    defb 00
   EDUP 

ITEM_ARRAY:

Chair_1: items.Item Chair_Item, 5,7, Floor, #ff, 00
Chair_2: items.Item Chair_Item, 5,11, Floor, #ff, 00
Chair_3: items.Item Chair_Item, 5,15, Floor, #ff, 00
Chair_4: items.Item Chair_Item, 5,19, Floor, #ff, 00
Chair_5: items.Item Chair_Item, 5,23, Floor, #ff, 00

  DUP items.Item*100-5
    defb #ff; item.itemID = #ff - признак того что предмета нет 
   EDUP

ItemArraySize equ 100; максимальное число предметов 

no_way_script: ; неуспех 
  SetVar zxengine.var_ret, 0
no_script:  ;  никак не нужно обрабатывать коллизию с сущностью
  defb _endByte

; сигнал о получении приходит только после 
; НАЗАД и открыть аккаунт по-новой

chair_script_binary:
  ; ld a, zxengine.var_act
  ; call zxengine.getVar
  ; LD A, 5
  ; CALL FX_SET

  LD A, (zxengine.varsTab + zxengine.var_act )
  CP Entities.do_stand
  RET Z

  ; LD A, 56
  ; CALL FX_SET

  ; di
  ; halt
  RET

chair_script:
  CallCode chair_script_binary
  ; IfVar zxengine.var_act, Entities.do_take, chair_take_script
  ; shiruFX 55
  defb _endByte

chair_take_script:
  shiruFX 56
  defb _endByte

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

wall_script:
  ; goto computer_off_script
  ; rPlayVibr 1
  ; laserFX
  ; AddItemMap 13,22, Shard_Item
  shiruFX 2
  CallScript action_ring_explode
  goto no_way_script

door_open_script:
  defb _endByte
  ; SetActionCell Door_half_open
  ; SetActionCell Door_closed
  ; goto no_way_script

ballon_script:
  CallScript action_ring_explode
  goto no_way_script

; ----- проверяем дверь
door_script:
  CallCode binary_hand_to_var
  IfVar zxengine.var_item_id, 0, door_script_1
  goto no_way_script
door_script_1:
  shiruFX 43
  FxActionCell Door_half_open
  wait_halt 3
  SetActionCell Door_open
  goto no_way_script

computer_on_script:
  CallCode binary_hand_to_var
  IfVar zxengine.var_item_id, Chair_spr, computer_glass_destroy:
  shiruFX 55
  SetActionCell Computer_off
  goto no_way_script

computer_off_script:
  CallCode binary_hand_to_var
  IfVar zxengine.var_item_id, Chair_spr, computer_glass_destroy:
  shiruFX 55
  SetActionCell Computer_on
  goto no_way_script

computer_glass_destroy:
  shiruFX 56
  CallScript action_ring_explode
  SetActionCell Computer_break
  CallCode binary_add_shard
  goto no_way_script

computer_break_script:
  shiruFX 56
  CallScript action_ring_explode
  SetActionCell Floor
  goto no_way_script

; массив соответствия кода спрайта на карте типу энкаунтера
;cells_types_spr:
  ;dw cGround, cWater, cGreenBush

; позиция Y,X !!!
/* pos Point 0,0 ; позиция на карте
sprite db 00; спрайт
ground db 00; на чем стоит
flags db 00; признаки-флаги
name_p dw #0000 */

binary_add_shard:
; читаем что у нас подзорвалось
  LD DE, (Entities.MapCell_xy)
; Y+1 ( размещаем shard внизу взорвавшегося предмета )
  INC E
  ; INC E
  ; INC E
  LD A, Shard_Item
  CALL items.add_item_to_map
  RET

PersonagesNum equ 2
; описываем героев:
CHARS_SET:
Hero1: Entities.Hero 31,31, 9, 0, 0, tHeroName1, 00
Hero2: Entities.Hero 13,22, 9, 0, 0, tHeroName2, 00
; , 0, 0, 0, 0, 0
;Hero3: Entities.Hero 22,22, 12, 0, 0, tHeroName2
;defb _endByte
