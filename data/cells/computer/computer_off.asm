
ComputerOff.spr equ #14

  MODULE ComputerOff

    SETUP_CELL_TYPE_N Computer_cell_name, computer_off_script

computer_off_script:
  IfVar Vars.var_act, do_drop, drop_script
  goto no_way_script

drop_script:
  ; CallCode items.get_hero_hand_item
  IfVar Vars.var_item_id, Chair.spr, computer_glass_destroy
  shiruFX FX_Poweroff
  ShowText Computer_off_hit_mess
  goto no_way_script

computer_glass_destroy:
  shiruFX 56
  CallScript action_ring_explode
  SetMapCell ComputerBreak.spr
  ShowText Computer_break_mess
  CallCode items.del_item_from_hand
  goto no_way_script

  ENDMODULE
