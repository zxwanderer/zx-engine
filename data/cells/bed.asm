
Bed.spr equ 19

  MODULE Bed

  SETUP_CELL_TYPE_N Bed_cell_name,  script

bed_script:
  IfVar Vars.var_act, do_get, take_
  ; FxActionCell Ring_expl_1
  defb _endByte

take_
  ShowText Take_bed_mess
  defb _endByte

  ENDMODULE
