

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

Bed_spr: equ #13

Shard_spr: equ #34
Chair_spr: equ #33
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

FX_Wall equ 51
FX_Cutt equ 7
FX_Cutt1 equ 8

; ENTITY_TABLE: [action][item1][item2][script_ptr]
; #ff - для любых предметов
CELL_TYPES:

; -- 0 --

Cell_Type_Empty:    Entities.CellType Empty_cell_name,    no_script ; 0
Cell_Type_Wall:     Entities.CellType Wall_cell_name,     wall_script ; 1
Cell_Type_Door:     Entities.CellType Door_cell_name,     door_script ; 2
Cell_Type_Floor:    Entities.CellType Floor_cell_name,    floor_script ; 3
Cell_Type_Computer: Entities.CellType Computer_cell_name, computer_on_script ; 4
Cell_Type_Ballon:   Entities.CellType Ballon_cell_name,   no_script ; 5
Cell_Type_GridWall: Entities.CellType Soft_wall_name,     grid_wall_script ; 6
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
Cell_Type_13:        Entities.CellType Bed_cell_name,   bed_script ; 3
Cell_Type_Off_Computer: Entities.CellType Computer_cell_name, computer_off_script; 4
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
Cell_Type_Computer_Break: Entities.CellType Computer_cell_name, computer_break_script; 4
Cell_Type_25:        Entities.CellType Empty_cell_name,   no_script ; 5
Cell_Soft_Wall_Break: Entities.CellType Soft_wall_name,   soft_wall_break_script ; 6
Cell_Electronic:     Entities.CellType Electronic_cell_name, electronic_script ; 7
Cell_Type_28:        Entities.CellType Electronic_break_name, electronic_break_script; 8
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
Cell_Type_32:        Entities.CellType Trash_cell_name,   trash_script ; 2
Cell_Type_Chair:     Entities.CellType Chair_item_name,   chair_script ; 3
Cell_Type_Shard:     Entities.CellType Shard_item_name,   shard_script ; 4
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
; Shard_1: items.Item Shard_Item, 5,23, Floor, #ff, 00
Chair_5: items.Item Chair_Item, 5,23, Floor, #ff, 00

  DUP items.Item*100-5
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
  IfVar Vars.var_item_id, Shard_spr, electronic_script_off
electronic_script_break:
  shiruFX FX_Wall
  ShowText Electronic_kick_mess
  CallScript action_ring_explode
  SetMapCell Electronic_break_spr
  goto no_way_script

electronic_script_off:
  ShowText Electronic_kick_open_mess
  CallCode binary_open_door
  goto no_way_script

trash_script:
  IfVar Vars.var_act, do_get, take_trash_script
  defb _endByte

take_trash_script
  ShowText Take_trash_mess
  defb _endByte

floor_script:
  IfVar Vars.var_act, do_get, take_floor_script
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

shard_script:
  IfVar Vars.var_act, do_get, take_shard_script
  defb _endByte
take_shard_script:
  ShowText Take_shard_mess
  defb _endByte

chair_script:
  IfVar Vars.var_act, do_get, take_chair_script
  defb _endByte

take_chair_script:
  ShowText Take_chair_mess
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
  shiruFX FX_Wall
  CallScript action_ring_explode
  CallCode items.get_hero_hand_item
  IfVar Vars.var_item_id, Shard_spr, break_shard
  ; CallCode binary_show_screen
  ShowText Wall_mess
  goto no_way_script

break_shard:
  CallCode items.del_item_from_hand
  ; CallCode binary_show_screen
  ShowText Break_shard_mess
  goto no_way_script

grid_wall_script:
  CallCode items.get_hero_hand_item
  IfVar Vars.var_item_id, Shard_spr, grid_wall_break
  shiruFX 2
  CallScript action_ring_explode
  CallCode binary_show_screen
  ShowText Soft_wall_hit_mess
  goto no_way_script
grid_wall_break
  shiruFX FX_Cutt
  SetMapCell Soft_wall_break_spr
  ; CallCode binary_show_screen
  ShowText Shard_to_soft_wall_mess
  goto no_way_script

soft_wall_break_script:
  shiruFX FX_Cutt1
  CallScript action_ring_explode
  IfVarN Vars.var_pos_y, 6, soft_wall_break_on
  IfVarN Vars.var_pos_x, 22, soft_wall_break_on

soft_wall_break_electronic_script:
  SetMapCell Electronic_spr
  CallCode binary_show_screen
  ShowText Soft_wall_show_electronic
  goto no_way_script

soft_wall_break_on:
  SetMapCell Wall_spr
  CallCode binary_show_screen
  ShowText Soft_wall_clean
  goto no_way_script


door_open_script:
  defb _endByte

ballon_script:
  CallScript action_ring_explode
  goto no_way_script

; ----- проверяем дверь
door_script:
  CallCode items.get_hero_hand_item
  IfVar Vars.var_item_id, Chair_spr, door_kick_chair
  IfVar Vars.var_item_id, Shard_spr, door_kick_shard
  ; goto no_way_script
; door_script_1:
  ; shiruFX 43
  ; FxActionCell Door_half_open
  ; wait_halt 3
  ; SetMapCell Door_open
  shiruFX 2
  CallScript action_ring_explode
  ShowText Door_not_open_mess
  goto no_way_script

door_kick_chair:
  shiruFX FX_Wall
  CallScript action_ring_explode
  ShowText Door_kick_chair_mess
  goto no_way_script

door_kick_shard:
  shiruFX FX_Cutt1
  CallScript action_ring_explode
  ShowText Door_kick_shard_mess
  goto no_way_script

computer_on_script:
  CallCode items.get_hero_hand_item
  IfVar Vars.var_item_id, Chair_spr, computer_glass_destroy
  shiruFX 55
  SetMapCell Computer_off
  ; CallCode binary_script_statis_off
  CallCode binary_show_screen
  ShowText Computer_off_mess
  goto no_way_script

computer_off_script:
  CallCode items.get_hero_hand_item
  IfVar Vars.var_item_id, Chair_spr, computer_glass_destroy
  shiruFX FX_Poweroff
  ; CallScript action_ring_explode
  ; CallCode binary_show_screen
  ShowText Computer_off_hit_mess
  ; SetMapCell Computer_on
  ; CallCode binary_script_statis_on
  ; ShowText Statis_on_mess
  goto no_way_script

computer_glass_destroy:
  shiruFX 56
  CallScript action_ring_explode
  SetMapCell Computer_break
  ; CallCode Entities.lookChar; вывод текста ниже затормозит обновление экрана поэтому вызываем его вручную
  CallCode binary_show_screen
  ShowText Computer_break_mess
  CallCode items.del_item_from_hand
  goto no_way_script

computer_break_script:
  shiruFX 56
  CallScript action_ring_explode
  SetMapCell Trash_spr
  CallCode binary_add_shard
  ; CallCode Entities.lookChar
  CallCode binary_show_screen
  ShowText Computer_add_shard_mess
  goto no_way_script

; binary_script_statis_on:
  ; LD DE, (Vars.MapCell_xy)
  ; DEC D
  ; DEC D
  ; LD A, #B3
  ; CALL Entities.set_map_cell_DE
  ; RET

; binary_script_statis_off:
  ; LD DE, (Vars.MapCell_xy)
  ; DEC D
  ; DEC D
  ; LD A, Bed_spr
  ; CALL Entities.set_map_cell_DE
  ; RET

binary_open_door:
  ; LD A, Door_half_open
  ; LD DE, #
  RET
  
binary_add_shard:
  LD DE, (Vars.MapCell_xy); читаем где у нас подзорвалось
  INC E ; Y+1 ( размещаем shard внизу взорвавшегося предмета )
  LD A, Shard_Item
  CALL items.add_item_to_map
  RET

PersonagesNum equ 2

CHARS_SET: ; описываем героев:
Hero1: Entities.Hero 31,31, 9, 0, 0, tHeroName1, 00
Hero2: Entities.Hero 4,21, 9, 0, 0, tHeroName2, 00
