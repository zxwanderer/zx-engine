
Nipple.spr: equ 30

  MODULE Nipple
    SETUP_CELL_TYPE_N Nipple_cell_name, nipple_script

nipple_script:
  IfVar Vars.var_act, do_get, get_script
  ; IfVar Vars.var_act, do_stand, stand_script
  defb _endByte
get_script:
;   ShowText Take_floor_mess
  CallCode Entities.action_fault
  SetVar Vars.var_ret, 0
  defb _endByte
  ENDMODULE
