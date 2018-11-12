
SoftWallBreak.spr: equ #26

  MODULE SoftWallBreak
    SETUP_CELL_TYPE_N Soft_wall_name, soft_wal_script

soft_wal_script:
  IfVar Vars.var_act, do_get, soft_wall_break
  IfVar Vars.var_act, do_drop, soft_wall_break
  goto no_way_script

soft_wall_break:
  shiruFX FX_Cutt1
  CallScript action_ring_explode
  IfVarN Vars.var_pos_y, 4, soft_wall_break_on
  IfVarN Vars.var_pos_x, 14, soft_wall_break_on

soft_wall_break_electronic_script:
  SetMapCell Electronic.spr
  ShowText Soft_wall_show_electronic
  goto no_way_script

soft_wall_break_on:
  SetMapCell Wall.spr
  ShowText Soft_wall_clean
  goto no_way_script

  ENDMODULE
