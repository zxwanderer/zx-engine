
Nipple.spr: equ 30

  MODULE Nipple
    SETUP_CELL_TYPE_N Nipple_cell_name, script

script:
  IfVar Vars.var_act, do_stand, no_script
  IfVar Vars.var_act, do_get, no_way_script
  IfVar Vars.var_act, do_drop, drop_
  defb _endByte

drop_:
  IfVar Vars.var_item_id, Canister.spr, power_
  goto no_script

power_:
  CallCode items.del_item_from_hand
  SetMapCell CanisterPowered.spr
  IncVar Vars.power_on
  IfVar Vars.power_on, 1, power_start_
  goto no_script

power_start_:
  CallCode power_monitor_on
  goto no_script

power_monitor_on:
  LD D, 20
  LD E, 24
  CALL map.calc_pos
  LD A, Computer.spr
  LD (HL), A
  RET
  ENDMODULE
