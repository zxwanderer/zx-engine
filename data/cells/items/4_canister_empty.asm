CanisterEmpty.item: equ 4
CanisterEmpty.spr: equ 29

  MODULE CanisterEmpty

    SETUP_CELL_TYPE_N CanisterEmpty_cell_name, canister_empty_script
    SETUP_ITEM_TYPE_N
    
canister_empty_script:
  IfVar Vars.var_act, do_get, take_canister_empty_script
  goto say_no_way

take_canister_empty_script:
  defb _endByte

  ENDMODULE

