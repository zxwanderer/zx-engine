Scaf.item: equ 5
Scaf.spr: equ 25

  MODULE Scaf

    SETUP_CELL_TYPE_N Scaf_cell_name, script
    SETUP_ITEM_TYPE_N
    
script:
  IfVar Vars.var_act, do_stand, no_way_script
  IfVar Vars.var_act, do_get, take_
  IfVar Vars.var_act, do_drop, drop_
  defb _endByte
take_:
  goto no_script
drop_:
  goto no_way_script

  ENDMODULE
