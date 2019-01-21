
Bed.spr equ 19

  MODULE Bed

; _temp equ $
  SETUP_CELL_TYPE_N Bed_cell_name,  bed_script
  ; ORG _temp

bed_script:
  IfVar Vars.var_act, do_get, take_bed_script
  ; FxActionCell Ring_expl_1
  defb _endByte
take_bed_script
  ShowText Take_bed_mess
  defb _endByte

  ENDMODULE
