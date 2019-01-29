ScafPlace.spr: equ 190

  MODULE ScafPlace

    SETUP_CELL_TYPE_N ScafPlace_cell_name, script

script:
  IfVar Vars.var_act, do_stand, no_script
  IfVar Vars.var_act, do_get, get_
  IfVar Vars.var_act, do_drop, no_way_script
  defb _endByte

get_:
  
  defb _endByte

;   IfVar Vars.var_act, do_drop, drop_table_script
;   IfVar Vars.var_act, do_stand, no_way_script
;   defb _endByte

  ENDMODULE