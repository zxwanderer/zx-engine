
ComputerOff.spr equ #14

  MODULE ComputerOff

    SETUP_CELL_TYPE_N Computer_cell_name, script

script:
  IfVar Vars.var_act, do_drop, drop_
  IfVar Vars.var_act, do_get, get_
  goto no_way_script

drop_:
  IfVar Vars.var_item_id, Chair.spr, computer_glass_destroy
  goto computer_screen_destroy
  ; IfVar Vars.var_item_id, CanisterEmpty.spr, computer_glass_destroy
  ; IfVar Vars.var_item_id, Nippers.spr, computer_screen_destroy
  ; IfVar Vars.var_item_id, Canister.spr, computer_screen_destroy
  ; IfVar Vars.var_item_id, Wrench.spr, computer_screen_destroy
get_:
  shiruFX FX_Poweroff
  ShowText Computer_off_hit_mess
  goto no_way_script

computer_glass_destroy:
  shiruFX 56
  CallScript action_ring_explode
  SetMapCell ComputerBreak.spr
  ShowText Computer_break_chair_mess
  CallCode items.del_item_from_hand
  goto no_way_script

computer_screen_destroy:
  shiruFX 56
  CallScript action_ring_explode
  SetMapCell ComputerBreak.spr
  ShowText Computer_break_mess
  ; CallCode items.del_item_from_hand
  goto no_way_script

  ENDMODULE
