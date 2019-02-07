Analyzer.spr: equ 57
  MODULE Analyzer
    SETUP_CELL_TYPE_N Analyzer_cell_name, no_way_script
  ENDMODULE

AnalyzerOn.spr: equ 55
  MODULE AnalyzerOn
    SETUP_CELL_TYPE_N Analyzer_cell_name, script

script:
  IfVar Vars.var_act, do_stand, no_way_script
  IfVar Vars.var_act, do_get, get_
  IfVar Vars.var_act, do_drop, no_way_script
  goto no_way_script

get_:

  SetVar Vars.var_ret, 0
  ScanPosTable scan_table
  ; IfVar Vars.var_ret, 1, no_way_script
  goto no_way_script

scan_table:

  defb 28,6
  defw show_name1
  defb 28,8
  defw show_name2
  defb 28,10
  defw show_name3
  defb 28,12
  defw show_name4
  defb 28,14
  defw show_name5

  defb _endByte

show_name1:
  ShowText player_name1
  SetVar Vars.var_ret, 1
  defb _endByte

show_name2:
  ShowText player_name2
  SetVar Vars.var_ret, 1
  defb _endByte

show_name3:
  ShowText player_name3
  SetVar Vars.var_ret, 1
  defb _endByte

show_name4:
  ShowText player_name4
  SetVar Vars.var_ret, 1
  defb _endByte

show_name5:
  ShowText player_name5
  SetVar Vars.var_ret, 1
  defb _endByte

  ENDMODULE

; Евтимов Димчо
; Терзиев Недялко
; Господинов Илия
; Георгиев Васил