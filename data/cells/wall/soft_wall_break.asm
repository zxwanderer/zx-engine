
SoftWallBreak.spr: equ #26

  MODULE SoftWallBreak

_temp equ $; запоминаем адрес

    SETUP_CELL_TYPE Soft_wall_name,   soft_wall_break_script

  ORG _temp; восстанавливаем адрес
  
soft_wall_break_script:
  shiruFX FX_Cutt1
  CallScript action_ring_explode
  IfVarN Vars.var_pos_y, 6, soft_wall_break_on
  IfVarN Vars.var_pos_x, 22, soft_wall_break_on

soft_wall_break_electronic_script:
  SetMapCell Electronic.spr
  ShowText Soft_wall_show_electronic
  goto no_way_script

soft_wall_break_on:
  SetMapCell Wall_spr
  ShowText Soft_wall_clean
  goto no_way_script

  ENDMODULE
