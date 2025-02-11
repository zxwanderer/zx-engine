Wrench.item: equ 5
Wrench.spr: equ 61

  MODULE Wrench

    SETUP_CELL_TYPE_N Wrench_cell_name, script
    SETUP_ITEM_TYPE_N
    
script:
  IfVar Vars.var_act, do_stand, no_script
  IfVar Vars.var_act, do_get, take_
  IfVar Vars.var_act, do_drop, drop_
  defb _endByte
take_:
  ; goto no_script
  defb _endByte
drop_:
  goto no_way_script

  ENDMODULE

