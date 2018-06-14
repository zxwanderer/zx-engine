
Trash.spr equ #32

  MODULE Trash

_temp equ $

  SETUP_CELL_TYPE Trash_cell_name,  trash_script

  ORG _temp

trash_script:
  IfVar Vars.var_act, do_get, take_trash_script
  defb _endByte

take_trash_script
  ShowText Take_trash_mess
  defb _endByte

  ENDMODULE
