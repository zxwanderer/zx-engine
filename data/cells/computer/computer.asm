
Computer.spr equ #04

  MODULE Computer

    SETUP_CELL_TYPE_N Computer_cell_name, computer_script

computer_script:
  IfVar Vars.var_act, do_get, use_script
  IfVar Vars.var_act, do_drop, use_script
  goto no_way_script
use_script:
  CallCode items.get_hero_hand_item
  IfVar Vars.var_item_id, Chair.spr, computer_glass_destroy_kill
  shiruFX 55
  SetMapCell ComputerOff.spr
  ShowText Computer_off_mess
  goto no_way_script

computer_glass_destroy_kill:
  shiruFX 19
  CallScript action_ring_explode
  SetMapCell ComputerBreak.spr
  SetVar Vars.game_over, 1
  goto no_way_script

  ENDMODULE
