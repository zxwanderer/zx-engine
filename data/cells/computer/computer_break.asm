
ComputerBreak.spr equ #24

  MODULE ComputerBreak

    SETUP_CELL_TYPE_N Computer_break_cell_name, computer_break_script
  
computer_break_script:
  IfVar Vars.var_act, do_get, use_script
  IfVar Vars.var_act, do_drop, use_script
  goto no_way_script

use_script:
  shiruFX 56
  CallScript action_ring_explode
  SetMapCell Trash.spr
  ShowText Computer_add_shard_mess
  goto no_way_script

  ENDMODULE
