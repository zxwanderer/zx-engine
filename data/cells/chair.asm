
Chair.item: equ 1
Chair.spr: equ #33

  MODULE Chair

_temp equ $; запоминаем адрес

;   ORG CELL_TYPES+spr*CellType
;   CellType Chair_item_name, chair_script

;   ORG ITEM_TYPES+item*CellType
;   ItemType spr, 0, 10

    SETUP_CELL_TYPE Chair_item_name, chair_script

    SETUP_ITEM_TYPE

  ORG _temp; восстанавливаем адрес

chair_script:
  IfVar Vars.var_act, do_get, take_chair_script
  defb _endByte

take_chair_script:
  ShowText Take_chair_mess
  defb _endByte

  ENDMODULE
