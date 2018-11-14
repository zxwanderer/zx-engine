
Trash.spr equ #32

  MODULE Trash
  SETUP_CELL_TYPE_N Trash_cell_name,  trash_script

trash_script:
  IfVar Vars.var_act, do_get, take_trash_script
  defb _endByte

take_trash_script
  ShowText Take_trash_mess
  CallCode binary_get_shard
  goto no_way_script
  ; defb _endByte

binary_get_shard:
  ; LD A, Shard.item
  ; CALL items.add_item_to_hand
  ; LD A, FX_Pickup
  ; CALL FX_SET
  RET

  ENDMODULE
