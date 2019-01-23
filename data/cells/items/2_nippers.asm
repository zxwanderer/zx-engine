
Nippers.item: equ 2
Nippers.spr: equ 60

  MODULE Nippers

  SETUP_CELL_TYPE_N Nippers_item_name, script
  SETUP_ITEM_TYPE_N

script:
  IfVar Vars.var_act, do_stand, no_script
  IfVar Vars.var_act, do_get, take_
  IfVar Vars.var_act, do_drop, drop_
  defb _endByte

drop_:
  goto no_way_script
  
take_:
;   ShowText Take_nippers_mess
  defb _endByte

  ENDMODULE
