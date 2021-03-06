
Door.spr equ #02
Door_half_open equ #12

  MODULE Door

    SETUP_CELL_TYPE_N Door_cell_name, door_script
  
door_script:
  IfVar Vars.var_act, do_stand, not_open_
  IfVar Vars.var_act, do_get, not_open_
  IfVar Vars.var_act, do_drop, drop_
  defb _endByte

drop_:
  IfVar Vars.var_item_id, Shard.spr, base_kick_shard_fault
  ; IfVar Vars.var_item_id, Chair.spr, base_kick_fault
  ; IfVar Vars.var_item_id, Nippers.spr, base_kick_fault
  goto base_kick_fault

not_open_:
  ShowText Door_not_open_mess
  shiruFX FX_Nope
  goto no_way_script

open_:
  shiruFX 43
  SetMapCell DoorOpen.spr
  goto need_look_no_way

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
  IfVar Vars.var_act, do_stand, not_open_
  IfVar Vars.var_act, do_get, not_open_
  IfVar Vars.var_act, do_drop, drop_
  goto no_way_script

not_open_:
  IfVar Vars.power_on,Vars.MAX_BIOCONTAINERS_FOR_POWER_ON, force_open_
  ; shiruFX 43
  ; SetMapCell DoorGreenOpen.spr
  ShowText Door_not_open_mess
  shiruFX FX_Nope
  goto no_way_script

drop_:
  IfVar Vars.var_item_id, Wrench.spr, force_open_
  goto Door.drop_ ; наследование!!! лол ^)

force_open_:
  shiruFX 43
  SetMapCell DoorGreenOpen.spr
  goto need_look_no_way
  ENDMODULE

DoorGreenOpen.spr: equ #6c
  MODULE DoorGreenOpen
    SETUP_CELL_TYPE_N Door_cell_name, script

script:
  IfVar Vars.var_act, do_get, try_close_
  IfVar Vars.var_act, do_drop, try_drop_
  defb _endByte

try_drop_:
  IfVar Vars.var_item_id, Wrench.spr, force_close_
  defb _endByte

try_close_:
  IfVar Vars.power_on,Vars.MAX_BIOCONTAINERS_FOR_POWER_ON, force_close_
  shiruFX FX_Nope
  goto no_way_script

force_close_:
  shiruFX 43
  SetMapCell DoorGreen.spr
  goto need_look_no_way
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
  ;к сожалению шлюз здесь только один, поэтому координаты дверей захардкожены
  SetVar Vars.var_ret, 0
  CallCode binary_check_doors_is_closed ; проверяем открыты ли обе двери
  IfVar Vars.var_ret, 1, force_open_norm

  SetVar Vars.game_over, 2
  goto force_open_norm

force_open_norm:
  shiruFX 43
  SetMapCell DoorRedHardOpen.spr
  goto need_look_no_way

; две двери шлюза захардкожены (!)
binary_check_doors_is_closed:
  LD D, 20
  LD E, 18
  CALL map.calc_pos
  LD A, (HL); получили спрайт
  CP DoorRedHard.spr
  RET NZ
  LD D, 22
  LD E, 21
  CALL map.calc_pos
  LD A, (HL); получили спрайт
  CP DoorRedHard.spr
  RET NZ
  LD A, 1
  setVar Vars.var_ret
  RET
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
  shiruFX 43
  SetMapCell DoorRedHard.spr
  goto need_look_no_way

  ENDMODULE  