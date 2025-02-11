
ComputerBreak.spr equ #24

  MODULE ComputerBreak

    SETUP_CELL_TYPE_N Computer_break_cell_name, computer_break_script

computer_break_script:
  IfVar Vars.var_act, do_get, destroy_
  IfVar Vars.var_act, do_drop, drop_
  goto no_way_script

drop_:
  CheckActiveItem _computer_off_drop_table
  goto no_way_script

_computer_off_drop_table:
  SetIndexPointer Chair.spr, destroy_
  SetIndexPointer CanisterEmpty.spr, destroy_
  SetIndexPointer Nippers.spr, destroy_
  SetIndexPointer Canister.spr, destroy_
  SetIndexPointer CanisterRed.spr, destroy_
  SetIndexPointer Wrench.spr, destroy_
  SetIndexPointer Shard.spr, base_kick_shard_fault
  SetIndexPointer RedCard.spr, base_kick_shard_fault
  defb _endByte

destroy_:
  shiruFX 56
  CallScript action_ring_explode
  SetMapCell Trash.spr
  ShowText Computer_add_shard_mess
  goto no_way_script

  ENDMODULE
