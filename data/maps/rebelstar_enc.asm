
  MACRO SETUP_CELL_TYPE _name, _script
    ORG CELL_TYPES+spr*CellType
    CellType _name, _script
  ENDM

  MACRO SETUP_ITEM_TYPE
    ORG ITEM_TYPES+item*CellType
    ItemType spr, 0, 10
  ENDM
    
    ; MACRO CELL_TYPE _name, _script
      ; CellType _name,  _script ; 34
    ; ENDM
    
    ; MACRO ITEM_TYPE _spr_num, _round, _weight
      ; ItemType _spr_num, _round, _weight
    ; ENDM

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

; Shard_Item: equ 0
; Chair_Item: equ 1

Bed_spr: equ #13

; Shard_spr: equ #34
; Chair_spr: equ #33
Trash_spr: equ #32

Wall_spr: equ #01
Soft_wall_spr: equ #06
Soft_wall_break_spr: equ #26
Electronic_spr: equ #27
Electronic_break_spr: equ #28

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
Cell_Type_Wall:     CellType Wall_cell_name,     wall_script ; 1
Cell_Type_Door:     CellType Door_cell_name,     door_script ; 2
Cell_Type_Floor:    CellType Floor_cell_name,    floor_script ; 3
Cell_Type_Computer: CellType Computer_cell_name, computer_on_script ; 4
Cell_Type_Ballon:   CellType Ballon_cell_name,   no_script ; 5
Cell_Type_GridWall: CellType Soft_wall_name,     grid_wall_script ; 6
Cell_Type_Canister: CellType Ballon_cell_name,   no_script ; 7
Cell_Type_Palm:     CellType Ballon_cell_name,   no_script ; 8
Cell_Type_Human:    CellType Ballon_cell_name,   no_script ; 9

Cell_Type_0A:       CellType Ballon_cell_name,  no_script ; A
Cell_Type_0B:       CellType Ballon_cell_name,  no_script ; B
Cell_Type_0C:       CellType Ballon_cell_name,  no_script ; C
Cell_Type_0D:       CellType Ballon_cell_name,  no_script ; D
Cell_Type_0E:       CellType Ballon_cell_name,  no_script ; E
Cell_Type_0F:       CellType Ballon_cell_name,  no_script ; F

; -- 01 --

Cell_Type_10:        CellType Empty_cell_name,   no_script ; 0
Cell_Type_11:        CellType Empty_cell_name,   no_script ; 1
Cell_Type_12:        CellType Door_cell_name,    no_script ; 2
Cell_Type_13:        CellType Bed_cell_name,   bed_script ; 3
Cell_Type_Off_Computer: CellType Computer_cell_name, computer_off_script; 4
Cell_Type_15:        CellType Empty_cell_name,   no_script ; 5
Cell_Type_16:        CellType Empty_cell_name,   no_script ; 6
Cell_Type_17:        CellType Empty_cell_name,   no_script ; 7
Cell_Type_18:        CellType Empty_cell_name,   no_script ; 8
Cell_Type_19:        CellType Empty_cell_name,   no_script ; 9
Cell_Type_1A:        CellType Empty_cell_name,   no_script ; A
Cell_Type_1B:        CellType Empty_cell_name,   no_script ; B
Cell_Type_1C:        CellType Empty_cell_name,   no_script ; C
Cell_Type_1D:        CellType Empty_cell_name,   no_script ; D
Cell_Type_1E:        CellType Empty_cell_name,   no_script ; E
Cell_Type_1F:        CellType Empty_cell_name,   no_script ; F

; -- 02 --

Cell_Type_20:        CellType Empty_cell_name,   no_script ; 0
Cell_Type_21:        CellType Empty_cell_name,   no_script ; 1
Cell_Type_Door_Open: CellType Door_cell_name,    door_open_script ; 2
Cell_Type_23:        CellType Empty_cell_name,   no_script ; 3
Cell_Type_Computer_Break: CellType Computer_cell_name, computer_break_script; 4
Cell_Type_25:        CellType Empty_cell_name,   no_script ; 5
Cell_Soft_Wall_Break: CellType Soft_wall_name,   soft_wall_break_script ; 6
Cell_Electronic:     CellType Electronic_cell_name, electronic_script ; 7
Cell_Type_28:        CellType Electronic_break_name, electronic_break_script; 8
Cell_Type_29:        CellType Empty_cell_name,   no_script ; 9
Cell_Type_2A:        CellType Empty_cell_name,   no_script ; A
Cell_Type_2B:        CellType Empty_cell_name,   no_script ; B
Cell_Type_2C:        CellType Empty_cell_name,   no_script ; C
Cell_Type_2D:        CellType Empty_cell_name,   no_script ; D
Cell_Type_2E:        CellType Empty_cell_name,   no_script ; E
Cell_Type_2F:        CellType Empty_cell_name,   no_script ; F

; -- 03 --

Cell_Type_30:        CellType Empty_cell_name,   no_script ; 0
Cell_Type_31:        CellType Empty_cell_name,   no_script ; 1
Cell_Type_32:        CellType Trash_cell_name,   trash_script ; 2
Cell_Type_33:        CellType Empty_cell_name,   no_script ; 4
Cell_Type_34:        CellType Empty_cell_name,   no_script ; 4
Cell_Type_35:        CellType Empty_cell_name,   no_script ; 5
Cell_Type_36:        CellType Empty_cell_name,   no_script ; 6
Cell_Type_37:        CellType Empty_cell_name,   no_script ; 7
Cell_Type_38:        CellType Empty_cell_name,   no_script ; 8
Cell_Type_39:        CellType Empty_cell_name,   no_script ; 9
Cell_Type_3A:        CellType Empty_cell_name,   no_script ; A
Cell_Type_3B:        CellType Empty_cell_name,   no_script ; B
Cell_Type_3C:        CellType Empty_cell_name,   no_script ; C
Cell_Type_3D:        CellType Empty_cell_name,   no_script ; D
Cell_Type_3E:        CellType Empty_cell_name,   no_script ; E
Cell_Type_3F:        CellType Empty_cell_name,   no_script ; F

  DUP CellType*256-#3F
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
Chair_5: Item Chair.item, 5,23, Floor, #ff, 00

  DUP Item*100-5
    defb #ff; item.itemID = #ff - признак того что предмета нет 
   EDUP

ItemArraySize equ 100; максимальное число предметов 

no_way_script: ; неуспех 
  SetVar Vars.var_ret, 0
no_script:  ;  никак не нужно обрабатывать коллизию с сущностью
  defb _endByte

electronic_break_script
  shiruFX FX_Wall
  CallScript action_ring_explode
  ShowText Electronic_break_mess
  SetMapCell Wall_spr
  goto no_way_script

electronic_script
  CallCode items.get_hero_hand_item
  IfVar Vars.var_item_id, Shard.spr, electronic_script_off
electronic_script_break:
  shiruFX FX_Wall
  ShowText Electronic_kick_mess
  CallScript action_ring_explode
  SetMapCell Electronic_break_spr
  goto no_way_script

electronic_script_off:
  shiruFX 3
  ShowText Electronic_kick_open_mess
  SetVar varDoorUnlock, 100
  SetMapCell Electronic_break_spr
  goto no_way_script

trash_script:
  IfVar Vars.var_act, do_get, take_trash_script
  defb _endByte

take_trash_script
  ShowText Take_trash_mess
  defb _endByte

floor_script:
  IfVar Vars.var_act, do_get, take_floor_script
  IfVarN Vars.var_pos_y, 7, floor_script_normal
  SetVar Vars.game_over, 2
  defb _endByte
floor_script_normal:
  defb _endByte
take_floor_script
  ShowText Take_floor_mess
  defb _endByte

bed_script:
  IfVar Vars.var_act, do_get, take_bed_script
  defb _endByte
take_bed_script
  ShowText Take_bed_mess
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

wall_script:
  CallCode items.get_hero_hand_item
  IfVar Vars.var_item_id, Shard.spr, break_shard
  shiruFX FX_Wall
  CallScript action_ring_explode
  ShowText Wall_mess
  goto no_way_script

break_shard:
  shiruFX 21
  CallCode items.del_item_from_hand
  ShowText Break_shard_mess
  goto no_way_script

grid_wall_script:
  CallCode items.get_hero_hand_item
  IfVar Vars.var_item_id, Shard.spr, grid_wall_break
  IfVar Vars.var_item_id, #ff, grid_wall_break_empty; руки пусты
  shiruFX 17
  CallScript action_ring_explode
  ShowText Soft_wall_hit_item_mess
  goto no_way_script

grid_wall_break_empty:
  shiruFX 2
  CallScript action_ring_explode
  ShowText Soft_wall_hit_mess
  goto no_way_script

grid_wall_break
  shiruFX FX_Cutt
  SetMapCell Soft_wall_break_spr
  ShowText Shard_to_soft_wall_mess
  goto no_way_script

soft_wall_break_script:
  shiruFX FX_Cutt1
  CallScript action_ring_explode
  IfVarN Vars.var_pos_y, 6, soft_wall_break_on
  IfVarN Vars.var_pos_x, 22, soft_wall_break_on

soft_wall_break_electronic_script:
  SetMapCell Electronic_spr
  ShowText Soft_wall_show_electronic
  goto no_way_script

soft_wall_break_on:
  SetMapCell Wall_spr
  ShowText Soft_wall_clean
  goto no_way_script

door_open_script:
  shiruFX 38
  defb _endByte

ballon_script:
  CallScript action_ring_explode
  goto no_way_script

; ----- проверяем дверь
door_script:
  IfVar varDoorUnlock, 100, door_do_open
  CallCode items.get_hero_hand_item
  IfVar Vars.var_item_id, Chair.spr, door_kick_chair
  IfVar Vars.var_item_id, Shard.spr, door_kick_shard
  shiruFX FX_Nope
  ShowText Door_not_open_mess
  goto no_way_script

door_do_open:  
  shiruFX 43
  FxActionCell Door_half_open
  wait_halt 3
  SetMapCell Door_open
  goto no_way_script

door_kick_chair:
  shiruFX FX_Wall
  CallScript action_ring_explode
  ShowText Door_kick_chair_mess
  goto no_way_script

door_kick_shard:
  shiruFX 39
  CallScript action_ring_explode
  ShowText Door_kick_shard_mess
  goto no_way_script

computer_on_script:
  CallCode items.get_hero_hand_item
  IfVar Vars.var_item_id, Chair.spr, computer_glass_destroy_kill
  shiruFX 55
  SetMapCell Computer_off
  ShowText Computer_off_mess
  goto no_way_script

computer_off_script:
  CallCode items.get_hero_hand_item
  IfVar Vars.var_item_id, Chair.spr, computer_glass_destroy
  shiruFX FX_Poweroff
  ShowText Computer_off_hit_mess
  goto no_way_script

computer_glass_destroy_kill:
  shiruFX 19
  CallScript action_ring_explode
  SetMapCell Computer_break
  SetVar Vars.game_over, 1
  goto no_way_script

computer_glass_destroy:
  shiruFX 56
  CallScript action_ring_explode
  SetMapCell Computer_break
  ShowText Computer_break_mess
  CallCode items.del_item_from_hand
  goto no_way_script

computer_break_script:
  shiruFX 56
  CallScript action_ring_explode
  SetMapCell Trash_spr
  CallCode binary_add_shard
  ShowText Computer_add_shard_mess
  goto no_way_script

binary_add_shard:
  LD DE, (Vars.MapCell_xy); читаем где у нас подзорвалось
  INC E ; Y+1 ( размещаем shard внизу взорвавшегося предмета )
  LD A, Shard.item
  CALL items.add_item_to_map
  RET

PersonagesNum equ 1

CHARS_SET: ; описываем героев:
; Hero1: Entities.Hero 31,31, 9, 0, 0, tHeroName1, 00
Hero2: Hero 4,21, 9, 0, 0, tHeroName2, 00
