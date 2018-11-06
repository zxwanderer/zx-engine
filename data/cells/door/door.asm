
Door.spr equ #02
Door_half_open equ #12

  MODULE Door

    SETUP_CELL_TYPE_N Door_cell_name, door_script
  
door_script:
  goto door_do_open
  ; IfVar varDoorUnlock, 100, door_do_open
  CallCode items.get_hero_hand_item
  IfVar Vars.var_item_id, Chair.spr, door_kick_chair
  IfVar Vars.var_item_id, Shard.spr, door_kick_shard
  shiruFX FX_Nope
  ShowText Door_not_open_mess
  goto no_way_script

door_do_open:  
  shiruFX 43
;   FxActionCell Door_half_open
;   wait_halt 3
  SetMapCell DoorOpen.spr
  goto no_way_script

door_kick_chair:
  shiruFX FX_Wall
  CallScript action_ring_explode
  ShowText Door_kick_chair_mess
  goto no_way_script

door_kick_shard:
  shiruFX 39
  CallScript action_ring_explode
  ShowText Door_kick_shard_mess
  goto no_way_script

  ENDMODULE
