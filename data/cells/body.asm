BodyYellow.spr: equ 10
  MODULE BodyYellow
    SETUP_CELL_TYPE_N BodyInScaf_cell_name, script

script:
  IfVar Vars.var_act, do_get, get_
  IfVar Vars.var_act, do_drop, drop_
  defb _endByte

get_:
  ShowText Body_no_get
  goto nope_script
  ENDMODULE

drop_:
  shiruFX FX_Cutt1
  SetMapCell Blood.spr
  goto need_look_no_way

BodyWhite.spr: equ 27
  MODULE BodyWhite
    SETUP_CELL_TYPE_N Body_cell_name, BodyYellow.script
  ENDMODULE

BodyBlue.spr: equ 28
  MODULE BodyBlue
    SETUP_CELL_TYPE_N BodyTech_cell_name, BodyYellow.script
  ENDMODULE
