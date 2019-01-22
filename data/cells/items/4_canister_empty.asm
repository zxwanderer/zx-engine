CanisterEmpty.item: equ 4
CanisterEmpty.spr: equ 29

  MODULE CanisterEmpty

    SETUP_CELL_TYPE_N CanisterEmpty_cell_name, script
    SETUP_ITEM_TYPE_N
    
script:
  IfVar Vars.var_act, do_get, no_script
  IfVar Vars.var_act, do_drop, drop
  goto no_way_script

drop:


  ENDMODULE

