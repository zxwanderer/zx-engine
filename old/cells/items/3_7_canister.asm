Canister.item: equ 3
Canister.spr: equ 7

  MODULE Canister

    SETUP_CELL_TYPE_N Canister_cell_name, script
    SETUP_ITEM_TYPE_N

script:
  CheckActionReaction _canister_action_table
  goto no_way_script

_canister_action_table:
  SetIndexPointer do_get, no_script ; можно взять
  defb _endByte

  ENDMODULE

CanisterPowered.spr: equ 114
  MODULE CanisterPowered
    SETUP_CELL_TYPE_N CanisterPowered_cell_name, no_way_script
  ENDMODULE

CanisterRed.item: equ 7
CanisterRed.spr: equ 113

  MODULE CanisterRed

    SETUP_CELL_TYPE_N Canister_cell_name, Canister.script
    SETUP_ITEM_TYPE_N

  ENDMODULE