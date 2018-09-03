Electronic.spr: equ #27

  MODULE Electronic

_temp equ $; запоминаем адрес

    SETUP_CELL_TYPE Electronic_cell_name, electronic_script

  ORG _temp; восстанавливаем адрес
  
electronic_script
  CallCode items.get_hero_hand_item
  IfVar Vars.var_item_id, Shard.spr, electronic_script_off
electronic_script_break:
  shiruFX FX_Wall
  ShowText Electronic_kick_mess
  CallScript action_ring_explode
  SetMapCell ElectronicBreak.spr
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
