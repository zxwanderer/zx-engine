
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

DoorOpen.spr: equ #22
  MODULE DoorOpen
    SETUP_CELL_TYPE_N Door_cell_name, DoorOpen_script
DoorOpen_script:
  defb _endByte
  ENDMODULE

DoorWhite.spr: equ #7b
  MODULE DoorWhite
    SETUP_CELL_TYPE_N Door_cell_name, door_script

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
    SETUP_CELL_TYPE_N Door_cell_name, door_script
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
    SETUP_CELL_TYPE_N Door_cell_name, door_script  
door_script:
  shiruFX 43
  SetMapCell DoorRedHardOpen.spr
  goto no_way_script
  ENDMODULE

DoorRedHardOpen.spr: equ #63
  MODULE DoorRedHardOpen
    SETUP_CELL_TYPE_N Door_cell_name, DoorOpen.DoorOpen_script
  ENDMODULE  