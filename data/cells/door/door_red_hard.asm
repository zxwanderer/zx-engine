
DoorRedHard.spr: equ #64

  MODULE DoorRedHard

    SETUP_CELL_TYPE_N Door_cell_name, door_script
  
door_script:
  ; shiruFX FX_Nope
  ; ShowText Door_not_open_mess
  ; goto no_way_script
  shiruFX 43
  SetMapCell DoorRedHardOpen.spr
  goto no_way_script

  ENDMODULE