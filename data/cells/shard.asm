
Shard.item: equ 0
Shard.spr: equ #34

  MODULE Shard

; _temp equ $

  SETUP_CELL_TYPE_N Shard_item_name, shard_script

  SETUP_ITEM_TYPE_N

  ; ORG _temp
shard_script:
  IfVar Vars.var_act, do_get, take_shard_script
  defb _endByte
take_shard_script:
  ShowText Take_shard_mess
  defb _endByte

  ENDMODULE
