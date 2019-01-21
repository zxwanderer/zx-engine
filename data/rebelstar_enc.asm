
  ; MACRO SETUP_CELL_TYPE _name, _script
  ;   ORG CELL_TYPES+spr*CellType
  ;   CellType _name, _script
  ; ENDM

  MACRO SETUP_CELL_TYPE_N _name, _script
._temp equ $; запоминаем адрес
    ORG CELL_TYPES+spr*CellType
    CellType _name, _script
    ORG ._temp
  ENDM

  ; MACRO SETUP_ITEM_TYPE
  ;   ORG ITEM_TYPES+item*ItemType
  ;   ItemType spr, 0, 10
  ; ENDM

  MACRO SETUP_ITEM_TYPE_N
._temp equ $; запоминаем адрес  
    ORG ITEM_TYPES+item*ItemType
    ItemType spr, 0, 10
    ORG ._temp
  ENDM

; обозначаем номера типов ячеек карты для лучшей адресации например открытие двери - SetActionCell Door_open

Ring_expl_1 equ #b0
Ring_expl_2 equ #b1
Ring_expl_3 equ #b2
Ring_expl_4 equ #b3

Hero_hand_item_spr: equ #0B
Hero_hand_empty: equ #09

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
    ; CellType Empty_cell_name, no_way_script
    defb 00
  EDUP

ITEM_TYPES:
  DUP ItemType*100
    defb 00
   EDUP

kick_shard_fault: ; неуспех резания острым
  shiruFX 39
  CallScript action_ring_explode
  ShowText Kick_shard_mess
  goto no_way_script

say_no_way:
  shiruFX FX_Wall
  CallScript action_ring_explode
  ShowText no_way_mess
no_way_script: ; неуспех
  SetVar Vars.var_ret, 0
no_script:  ;  никак не нужно обрабатывать коллизию с сущностью
  defb _endByte

; stand_script:
;   CallCode Entities.char_do_stand
;   defb _endByte

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
