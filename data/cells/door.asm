
Door.spr equ #02
Door_half_open equ #12

  MODULE Door

    SETUP_CELL_TYPE_N Door_cell_name, door_script
  
door_script:
  IfVar Vars.var_act, do_stand, get_script
  IfVar Vars.var_act, do_get, get_script
  IfVar Vars.var_act, do_drop, drop_script
  goto no_way_script

drop_script:
  IfVar Vars.var_item_id, Chair.spr, door_kick_chair
  IfVar Vars.var_item_id, Shard.spr, door_kick_shard
get_script:
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

DoorOpen.spr: equ #22
  MODULE DoorOpen
    SETUP_CELL_TYPE_N Door_cell_name, DoorOpen_script
DoorOpen_script:
  defb _endByte
  ENDMODULE

DoorYellow.spr: equ #6b
  MODULE DoorYellow
    SETUP_CELL_TYPE_N Door_cell_name, door_script

door_script:
  shiruFX 43
  SetMapCell DoorYellowOpen.spr
  goto no_way_script

  ENDMODULE

DoorYellowOpen.spr: equ #6c
  MODULE DoorYellowOpen
    SETUP_CELL_TYPE_N Door_cell_name, DoorOpen.DoorOpen_script
  ENDMODULE

DoorWhite.spr: equ #7b
  MODULE DoorWhite
    SETUP_CELL_TYPE_N Door_cell_name, Door.door_script

door_script:
  shiruFX 43
  SetMapCell DoorWhiteOpen.spr
  goto no_way_script

  ENDMODULE

DoorWhiteOpen.spr: equ #7c
  MODULE DoorWhiteOpen
    SETUP_CELL_TYPE_N Door_cell_name, DoorOpen.DoorOpen_script
  ENDMODULE

DoorBlue.spr: equ #8b
  MODULE DoorBlue
    SETUP_CELL_TYPE_N Door_cell_name, Door.door_script
door_script:
  shiruFX 43
  SetMapCell DoorBlueOpen.spr
  goto no_way_script
  ENDMODULE

DoorBlueOpen.spr: equ #8c
  MODULE DoorBlueOpen
    SETUP_CELL_TYPE_N Door_cell_name, DoorOpen.DoorOpen_script
  ENDMODULE

DoorRedHard.spr: equ #64
  MODULE DoorRedHard
    SETUP_CELL_TYPE_N Door_cell_name, Door.door_script  
door_script:
  shiruFX 43
  SetMapCell DoorRedHardOpen.spr
  goto no_way_script
  ENDMODULE

DoorRedHardOpen.spr: equ #63
  MODULE DoorRedHardOpen
    SETUP_CELL_TYPE_N Door_cell_name, DoorOpen.DoorOpen_script
  ENDMODULE  