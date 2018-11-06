
Trash.spr equ #32

  MODULE Trash

; _temp equ $

  SETUP_CELL_TYPE_N Trash_cell_name,  trash_script

  ; ORG _temp

trash_script:
  IfVar Vars.var_act, do_get, take_trash_script
  defb _endByte

take_trash_script
  ShowText Take_trash_mess
  CallCode binary_get_shard
  defb _endByte

binary_get_shard:
  LD A, Shard.item
  CALL items.add_item_to_hand
  LD A, FX_Pickup
  CALL FX_SET
  LD A, 0
  setVar Vars.var_ret; возвращаем по умолчанию 0 чтобы не было ошибки поднятия
  RET

  ENDMODULE
