Canister.item: equ 3
Canister.spr: equ 7

  MODULE Canister

    SETUP_CELL_TYPE_N Canister_cell_name, script
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

CanisterPowered.spr: equ 114
  MODULE CanisterPowered
    SETUP_CELL_TYPE_N CanisterPowered_cell_name, no_way_script
  ENDMODULE