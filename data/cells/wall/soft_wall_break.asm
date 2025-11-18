
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
  ; ShowText Soft_wall_clean
  goto need_look_no_way; на выходе должно быть 0 тогда дальше обрабатываться не будет

soft_wall_set_electronic_script:
  SetMapCell Electronic.spr
  ShowText Soft_wall_show_electronic
  SetVar Vars.var_ret, 1
  defb _endByte

soft_wall_make_grid_script:
  SetMapCell WallGrid.spr
  ShowText WallGrid_name
  SetVar Vars.var_ret, 1
  defb _endByte

soft_wall_make_cavity_script:
  SetMapCell WallCavity.spr
  ShowText WallCavity_name
  SetVar Vars.var_ret, 1
  defb _endByte

soft_wall_panel_table:

  defb 5,5
  defw soft_wall_set_electronic_script
  defb 11,5
  defw soft_wall_set_electronic_script
  defb 17,5
  defw soft_wall_set_electronic_script
  defb 5,9
  defw soft_wall_set_electronic_script
  defb 11,9
  defw soft_wall_set_electronic_script

  defb 19,4
  defw soft_wall_make_grid_script
  defb 16,9
  defw soft_wall_make_grid_script
  defb 3,6
  defw soft_wall_make_grid_script
  defb 3,8
  defw soft_wall_make_grid_script

  ; defb 17,5
  ; defw soft_wall_make_cavity_script
  defb 17,9
  defw soft_wall_make_cavity_script
  ; defb 19,3
  ; defw soft_wall_make_cavity_script

  defb _endByte

  ENDMODULE

WallHole.spr: equ 72

  MODULE WallHole
    SETUP_CELL_TYPE_N WallHole_name, Floor.script
  ENDMODULE

; display "soft_wall_panel_table", SoftWallBreak.soft_wall_panel_table
; display "soft_wall_break_electronic_script", SoftWallBreak.soft_wall_break_electronic_script