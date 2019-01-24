Pistol.spr: equ 22
  MODULE Pistol
    SETUP_CELL_TYPE_N Pistol_cell_name, script

script:
  IfVar Vars.var_act, do_stand, no_script
  IfVar Vars.var_act, do_get, no_way_script
  IfVar Vars.var_act, do_drop, no_script
  goto no_way_script

  ENDMODULE