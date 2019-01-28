
Computer.spr equ #04

  MODULE Computer

    SETUP_CELL_TYPE_N Computer_cell_name, script

script:
  IfVar Vars.var_act, do_get, use_get
  IfVar Vars.var_act, do_drop, use_drop
  goto no_way_script
  
use_get:

  SetVar Vars.var_ret, 0
  ScanPosTable computer_scan_table
  IfVar Vars.var_ret, 1, no_way_script

  shiruFX 55
  SetMapCell ComputerOff.spr
  ; ShowText Computer_off_mess
  goto no_way_script

use_drop:
  IfVar Vars.var_item_id, Chair.spr, computer_glass_destroy_kill
  goto no_way_script
  
computer_glass_destroy_kill:
  shiruFX 19
  CallScript action_ring_explode
  SetMapCell ComputerBreak.spr
  SetVar Vars.game_over, 1
  goto no_way_script

computer_scan_table:
  defb 23,19
  defw flip_flop_tambur
  defb 23,22
  defw flip_flop_tambur
  defb 23,3
  defw check_alert_code_found
  defb _endByte
  ; defb 5,9
  ; defw soft_wall_break_electronic_script
  ; defb 11,9
  ; defw soft_wall_break_electronic_script

check_alert_code_found:
  IfVar Vars.alert_code_found, 0, show_CALL_HELP_NO_CODE
  SetVar Vars.game_over, 3
  goto no_way_script

show_CALL_HELP_NO_CODE:
  shiruFX 55
  ShowText CALL_HELP_NO_CODE
  SetVar Vars.var_ret, 1
  defb _endByte

flip_flop_tambur:
  shiruFX 55
  CallCode binary_flip_flop_tambur
  SetVar Vars.var_ret, 1
  defb _endByte

binary_flip_flop_tambur:
  LD HL, MAP_SET+18*mapSize+20 ; x=20, y=18  
  LD A, (HL) ; смотрим закрыт ли внутренний люк
  CP DoorRedHard.spr
  JP Z, binary_close_tambur ; если закрыт то открываем его

binary_open_tambur:

  ; LD HL, MAP_SET+18*mapSize+20 ; x=20, y=18
  LD A, DoorRedHard.spr
  LD (HL),A

  LD HL, MAP_SET+21*mapSize+22 ; x=22, y=21
  LD A, DoorRedHardOpen.spr
  LD (HL),A
  RET

binary_close_tambur:
  ; LD HL, MAP_SET+18*mapSize+20 ; x=20, y=18
  LD A, DoorRedHardOpen.spr
  LD (HL),A

  LD HL, MAP_SET+21*mapSize+22 ; x=22, y=21
  LD A, DoorRedHard.spr
  LD (HL),A
  RET

  ENDMODULE
