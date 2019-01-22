
Acid.spr: equ 96

  MODULE Acid
    SETUP_CELL_TYPE_N Acid_cell_name, Acid_script

Acid_script:
  IfVar Vars.var_act, do_get, get_script
  IfVar Vars.var_act, do_stand, stand_script
  IfVar Vars.var_act, do_drop, drop_script
  defb _endByte
drop_script:
stand_script:
get_script:
;   ShowText Take_floor_mess
  CallCode Entities.action_fault
  SetVar Vars.var_ret, 0
  defb _endByte
  ENDMODULE