
Bed.spr equ #13

  MODULE Bed

_temp equ $

  SETUP_CELL_TYPE Bed_cell_name,  bed_script

  ORG _temp

bed_script:
  IfVar Vars.var_act, do_get, take_bed_script
  defb _endByte
take_bed_script
  ShowText Take_bed_mess
  defb _endByte

  ENDMODULE