
Wall.spr: equ #01

  MODULE Wall
    SETUP_CELL_TYPE_N Wall_cell_name,     wall_script

wall_script:
  IfVar Vars.var_act, do_get, get_script
  IfVar Vars.var_act, do_drop, drop_script
  goto no_way_script

drop_script:
  IfVar Vars.var_item_id, Shard.spr, break_shard

get_script:
  shiruFX FX_Wall
  CallScript action_ring_explode
  ShowText Wall_mess
  goto no_way_script

break_shard:
  shiruFX 21
  CallCode items.del_item_from_hand
  ShowText Break_shard_mess
  goto no_way_script

  ENDMODULE
