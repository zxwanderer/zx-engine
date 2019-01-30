ScafPlace.spr: equ 190

  MODULE ScafPlace

    SETUP_CELL_TYPE_N ScafPlace_cell_name, script

script:
  IfVar Vars.var_act, do_stand, no_script
  IfVar Vars.var_act, do_get, get_
  IfVar Vars.var_act, do_drop, no_way_script
  defb _endByte

; кладем скафандр по событию get так как он одет 
get_:
  SetVar Vars.var_ret, 0
  CallCode Scaf.binary_check_scaf
  IfVar Vars.var_ret, 1, no_way_script ; скафандр не одет 
  goto Scaf.unwear_scaf

  ENDMODULE