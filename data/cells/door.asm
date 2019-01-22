
Door.spr equ #02
Door_half_open equ #12

  MODULE Door

    SETUP_CELL_TYPE_N Door_cell_name, door_script
  
door_script:
  IfVar Vars.var_act, do_stand, get_
  IfVar Vars.var_act, do_get, get_
  IfVar Vars.var_act, do_drop, drop_
  defb _endByte

drop_:
  IfVar Vars.var_item_id, Chair.spr, base_kick_fault
  IfVar Vars.var_item_id, Nippers.spr, base_kick_fault
  IfVar Vars.var_item_id, Shard.spr, base_kick_shard_fault
get_:
  ShowText Door_not_open_mess
  shiruFX FX_Nope
  goto no_way_script

open_:
  shiruFX 43
  SetMapCell DoorOpen.spr
  goto no_way_script

; door_kick_chair:
;   shiruFX FX_Wall
;   CallScript action_ring_explode
;   ShowText Kick_fault_mess
;   goto no_way_script

; door_kick_shard:
;   shiruFX 39
;   CallScript action_ring_explode
;   ShowText Kick_shard_mess
;   goto no_way_script

  ENDMODULE

DoorOpen.spr: equ #22
  MODULE DoorOpen
    SETUP_CELL_TYPE_N Door_cell_name, DoorOpen_script
DoorOpen_script:
  defb _endByte
  ENDMODULE

DoorGreen.spr: equ #6b
  MODULE DoorGreen
    SETUP_CELL_TYPE_N Door_cell_name, script

script:
  IfVar Vars.var_act, do_stand, open_
  IfVar Vars.var_act, do_get, open_
  IfVar Vars.var_act, do_drop, Door.drop_
  goto no_way_script

open_:
  shiruFX 43
  SetMapCell DoorGreenOpen.spr
  goto no_way_script

  ENDMODULE

DoorGreenOpen.spr: equ #6c
  MODULE DoorGreenOpen
    SETUP_CELL_TYPE_N Door_cell_name, DoorOpen.DoorOpen_script
  ENDMODULE

DoorWhite.spr: equ #7b
  MODULE DoorWhite
    SETUP_CELL_TYPE_N Door_cell_name, Door.door_script

; door_script:
;   shiruFX 43
;   SetMapCell DoorWhiteOpen.spr
;   goto no_way_script

  ENDMODULE

DoorWhiteOpen.spr: equ #7c
  MODULE DoorWhiteOpen
    SETUP_CELL_TYPE_N Door_cell_name, DoorOpen.DoorOpen_script
  ENDMODULE

DoorBlue.spr: equ #8b
  MODULE DoorBlue
    SETUP_CELL_TYPE_N Door_cell_name, Door.door_script
; door_script:
;   shiruFX 43
;   SetMapCell DoorBlueOpen.spr
;   goto no_way_script
  ENDMODULE

DoorBlueOpen.spr: equ #8c
  MODULE DoorBlueOpen
    SETUP_CELL_TYPE_N Door_cell_name, DoorOpen.DoorOpen_script
  ENDMODULE

DoorRedHard.spr: equ #64
  MODULE DoorRedHard
    SETUP_CELL_TYPE_N DoorHard_cell_name, script

script:
  IfVar Vars.var_act, do_drop, drop_
  IfVar Vars.var_act, do_stand, no_way_script
  defb _endByte

drop_:
  IfVar Vars.var_item_id, Wrench.spr, force_open_
  goto no_way_script

force_open_:
  shiruFX FX_Boom
  CallScript action_ring_explode
  SetMapCell DoorRedHardOpen.spr
  goto no_way_script
  ENDMODULE

DoorRedHardOpen.spr: equ #63
  MODULE DoorRedHardOpen
    SETUP_CELL_TYPE_N DoorHard_cell_name, script

script:
  IfVar Vars.var_act, do_drop, drop_
  defb _endByte

drop_:
  IfVar Vars.var_item_id, Wrench.spr, force_close_
  goto no_way_script

force_close_:
  shiruFX FX_Boom
  CallScript action_ring_explode
  SetMapCell DoorRedHard.spr
  goto no_way_script
  ENDMODULE  