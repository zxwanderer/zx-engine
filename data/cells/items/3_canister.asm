Canister.item: equ 3
Canister.spr: equ 7

  MODULE Canister

    SETUP_CELL_TYPE_N Canister_cell_name, script
    SETUP_ITEM_TYPE_N

script:
  IfVar Vars.var_act, do_get, no_script
  goto no_way_script
    
  ENDMODULE
