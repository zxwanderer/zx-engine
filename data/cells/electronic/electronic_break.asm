
ElectronicBreak.spr: equ #28

  MODULE ElectronicBreak

    SETUP_CELL_TYPE_N Electronic_break_name, electronic_break_script
  
electronic_break_script
  shiruFX FX_Wall
  CallScript action_ring_explode
  ; ShowText Electronic_break_mess
  ShowText WallCavity_name
  SetMapCell WallCavity.spr
  goto no_way_script

  ENDMODULE
