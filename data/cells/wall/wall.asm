
Wall.spr: equ #01

  MODULE Wall
    SETUP_CELL_TYPE_N Wall_cell_name, script

script:
  IfVar Vars.var_act, do_get, no_way_script
  IfVar Vars.var_act, do_drop, drop_
  IfVar Vars.var_act, do_stand, no_way_script
  defb _endByte

drop_:
  IfVar Vars.var_item_id, Shard.spr, base_kick_shard_fault
  goto base_kick_fault

; get_:
  ; shiruFX FX_Wall
  ; CallScript action_ring_explode
  ; ShowText Wall_mess
  ; goto no_way_script

; break_shard:
;   shiruFX 21
;   ; CallCode items.del_item_from_hand
;   ; ShowText Break_shard_mess
;   goto no_way_script

  ENDMODULE
