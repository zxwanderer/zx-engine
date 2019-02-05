Safe.spr: equ 85
  MODULE Safe
    SETUP_CELL_TYPE_N Safe_cell_name, script
script:
  IfVar Vars.var_act, do_stand, no_way_script
  IfVar Vars.var_act, do_get, no_way_script
  IfVar Vars.var_act, do_drop, drop_
  defb _endByte

drop_:
  IfVar Vars.var_item_id, RedCard.spr, add_alert_code
  shiruFX FX_Wall
  CallScript action_ring_explode
  ShowText Safe_try_hit_mess
  goto no_way_script

add_alert_code:
  CallCode items.del_item_from_hand ; удаляем ключ-карту
  SetMapCell SafeEmpty.spr
  SetVar Vars.alert_code_found, 1
  ShowText FOUND_ALERT_CODE
  goto no_way_script

  ENDMODULE

SafeEmpty.spr: equ 101
  MODULE SafeEmpty
    SETUP_CELL_TYPE_N Safe_cell_name, no_way_script
  ENDMODULE  