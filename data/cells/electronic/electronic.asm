Electronic.spr: equ #27

  MODULE Electronic

    SETUP_CELL_TYPE_N Electronic_cell_name, electronic_script
  
electronic_script
  IfVar Vars.var_act, do_get, electronic_script_get
  IfVar Vars.var_act, do_drop, electronic_script_break
  goto no_way_script

electronic_script_break
  CallCode items.get_hero_hand_item
  IfVar Vars.var_item_id, Shard.spr, electronic_script_off
  shiruFX FX_Wall
  ShowText Electronic_kick_mess
  CallScript action_ring_explode
  SetMapCell ElectronicBreak.spr
  goto no_way_script

electronic_script_get
  shiruFX 3
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

binary_set_active_cell_left:
  LD A, ( Vars.MapCell_xy+Point.x )
  DEC A
  LD ( Vars.MapCell_xy+Point.x ), A
  RET

  ENDMODULE

FoodDispenser.spr: equ 87
  MODULE FoodDispenser
    SETUP_CELL_TYPE_N FoodDispenser_cell_name, say_no_way
  ENDMODULE