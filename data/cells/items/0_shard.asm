
Shard.item: equ 0
Shard.spr: equ #34

  MODULE Shard

  SETUP_CELL_TYPE_N Shard_item_name, script
  SETUP_ITEM_TYPE_N

script:
  IfVar Vars.var_act, do_get, take_
  IfVar Vars.var_act, do_drop, drop_
  defb _endByte
take_:
  ; ShowText Take_shard_mess
  defb _endByte
drop_: ; дропаем что-то из рук на эту ячейку =)
  goto no_way_script
  ; IfVar Vars.var_item_id, Shard.spr, no_way_script
  ; IfVar Vars.var_item_id, Chair.spr, base_kick_shard_fault
  ; IfVar Vars.var_item_id, Nippers.spr, base_kick_shard_fault
  ; IfVar Vars.var_item_id, CanisterEmpty.spr, base_kick_shard_fault
  ; IfVar Vars.var_item_id, Scaf.spr, base_kick_shard_fault
  ; IfVar Vars.var_item_id, Wrench.spr, base_kick_shard_fault
  defb _endByte

  ENDMODULE
