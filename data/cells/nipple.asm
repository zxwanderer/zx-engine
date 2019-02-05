
Nipple.spr: equ 30

  MODULE Nipple
    SETUP_CELL_TYPE_N Nipple_cell_name, script

script:
  IfVar Vars.var_act, do_stand, no_script
  IfVar Vars.var_act, do_get, no_way_script
  IfVar Vars.var_act, do_drop, drop_
  defb _endByte

drop_:
  IfVar Vars.var_item_id, Canister.spr, power_
  ; goto no_script
  defb _endByte

power_:
  CallCode items.del_item_from_hand
  SetMapCell CanisterPowered.spr
  IncVar Vars.power_on
  IfVar Vars.power_on, Vars.MAX_BIOCONTAINERS_FOR_POWER_ON, power_start_
  ; goto no_script
  defb _endByte

power_start_:
  ; SetVar Vars.power_on, Vars.MAX_BIOCONTAINERS_FOR_POWER_ON
  CallCode power_base_on
  ShowText Base_energy_on
  CallCode Entities.lookChar
  CallCode binary_play_intro
  goto no_way_script

power_base_on:

  LD HL, MAP_SET
  LD C, 31
power_base_on_l1:
  LD B, 31
power_base_on_l2:  
  INC HL
  
  LD A, (HL)

  CP ComputerOff.spr
  JP Z,power_monitor_on

  CP Analyzer.spr
  JP Z,power_analyzer_on

  CP Mentoscanner.spr
  JP Z,power_mentoscanner_on

power_base_on_l2_end:
  DJNZ power_base_on_l2  
  DEC C
  JP NZ,power_base_on_l1
  RET

power_monitor_on:
  LD A, Computer.spr
  LD (HL), A
  JP power_base_on_l2_end

power_analyzer_on:
  LD A, AnalyzerOn.spr
  LD (HL), A
  JP power_base_on_l2_end

power_mentoscanner_on:
  LD A, MentoscannerOn.spr
  LD (HL), A
  JP power_base_on_l2_end

  ENDMODULE
