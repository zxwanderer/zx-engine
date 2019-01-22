Scaf.item: equ 5
Scaf.spr: equ 25

  MODULE Scaf

    SETUP_CELL_TYPE_N Scaf_cell_name, script
    SETUP_ITEM_TYPE_N
    
script:
  IfVar Vars.var_act, do_get, get_
  IfVar Vars.var_act, do_drop, no_way_script
  IfVar Vars.var_act, do_stand, no_way_script
  defb _endByte

get_ 
  goto no_way_script  

  ENDMODULE

