
SoftWallBreak.spr: equ #26

  MODULE SoftWallBreak
    SETUP_CELL_TYPE_N Soft_wall_name, soft_wal_script

soft_wal_script:
  IfVar Vars.var_act, do_get, soft_wall_break
  IfVar Vars.var_act, do_drop, soft_wall_break
  goto no_way_script

soft_wall_break:
  SetVar Vars.var_ret, 0
  shiruFX FX_Cutt1
  CallScript action_ring_explode

  ScanPosTable soft_wall_panel_table
  IfVar Vars.var_ret, 1, no_way_script
  
soft_wall_break_on:
  SetMapCell Wall.spr
  ShowText Soft_wall_clean
  goto no_way_script; на выходе должно быть 0 тогда дальше обрабатываться не будет

soft_wall_break_electronic_script:
  SetMapCell Electronic.spr
  ShowText Soft_wall_show_electronic
  SetVar Vars.var_ret, 1
  defb _endByte

soft_wall_panel_table:
  defb 14,4
  defw soft_wall_break_electronic_script
  defb 18,4
  defw soft_wall_break_electronic_script

  defb 14,16
  defw soft_wall_break_electronic_script
  defb 18,16
  defw soft_wall_break_electronic_script
  defb 22,16
  defw soft_wall_break_electronic_script

  defb _endByte

  ENDMODULE

display "soft_wall_panel_table", SoftWallBreak.soft_wall_panel_table
display "soft_wall_break_electronic_script", SoftWallBreak.soft_wall_break_electronic_script