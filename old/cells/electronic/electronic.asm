Electronic.spr: equ #27

  MODULE Electronic

    SETUP_CELL_TYPE_N Electronic_cell_name, electronic_script
  
electronic_script
  IfVar Vars.var_act, do_get, no_way_script
  IfVar Vars.var_act, do_drop, electronic_script_break
  goto no_way_script

electronic_script_break
  CallCode items.get_hero_hand_item
  IfVar Vars.var_item_id, Shard.spr, electronic_script_off
  shiruFX FX_Wall
  ShowText Electronic_kick_mess
  CallScript action_ring_explode
  SetMapCell WallCavity.spr
  SetMapCellOnHero TrashEmpty.spr
  goto no_way_script

electronic_script_off:
  shiruFX 3
  ShowText Electronic_kick_open_mess
  SetMapCell ElectronicBreak.spr
  FxActionCell ElectronicBreak.spr; обновляем сразу спрайт на экране
  CallCode binary_set_active_cell_left
  shiruFX 43
  FxActionCell Door_half_open
  wait_halt 3
  SetMapCell DoorOpen.spr
  goto no_way_script

  ENDMODULE
