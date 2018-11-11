SoftWall.spr: equ #06

  MODULE SoftWall

    SETUP_CELL_TYPE_N Soft_wall_name, soft_wall_script
  
soft_wall_script:
  IfVar Vars.var_act, do_get, use_soft_wall_script
  goto no_way_script
  
use_soft_wall_script:
  CallCode items.get_hero_hand_item
  IfVar Vars.var_item_id, Shard.spr, soft_wall_break
  IfVar Vars.var_item_id, #ff, soft_wall_break_empty; руки пусты
  shiruFX 17
  CallScript action_ring_explode
  ShowText Soft_wall_hit_item_mess
  goto no_way_script

soft_wall_break_empty:
  shiruFX 2
  CallScript action_ring_explode
  ShowText Soft_wall_hit_mess
  goto no_way_script

soft_wall_break
  shiruFX FX_Cutt
  SetMapCell SoftWallBreak.spr
  ShowText Shard_to_soft_wall_mess
  goto no_way_script

  ENDMODULE
