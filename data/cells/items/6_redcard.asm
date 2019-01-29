RedCard.item: equ 6
RedCard.spr: equ 105

  MODULE RedCard
    SETUP_CELL_TYPE_N RedCard_cell_name, script
    SETUP_ITEM_TYPE_N

script:
  IfVar Vars.var_act, do_stand, no_script
  IfVar Vars.var_act, do_get, take_
  IfVar Vars.var_act, do_drop, drop_
  defb _endByte
take_:
  goto no_script
drop_:
  goto no_way_script


  ENDMODULE
