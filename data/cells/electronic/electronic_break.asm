
ElectronicBreak.spr: equ #28

  MODULE ElectronicBreak

    SETUP_CELL_TYPE_N Electronic_break_name, electronic_break_script
  
electronic_break_script
  IfVar Vars.var_act, do_drop, drop_script
  goto no_way_script

drop_script:
  shiruFX FX_Wall
  CallScript action_ring_explode
  ShowText Electronic_kick_mess
  SetMapCell WallCavity.spr
  SetMapCellOnHero TrashEmpty.spr
  goto no_way_script

  ENDMODULE
