Canister.item: equ 3
Canister.spr: equ 7

  MODULE Canister

    SETUP_CELL_TYPE_N Canister_cell_name, canister_script
    SETUP_ITEM_TYPE_N

canister_script:
  IfVar Vars.var_act, do_get, CanisterEmpty.take_canister_empty_script
  goto say_no_way

    
  ENDMODULE
