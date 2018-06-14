
Wall.spr: equ #01

  MODULE Wall

_temp equ $; запоминаем адрес

    SETUP_CELL_TYPE Wall_cell_name,     wall_script

  ORG _temp; восстанавливаем адрес
  
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

  ENDMODULE
