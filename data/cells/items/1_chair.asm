
Chair.item: equ 1
Chair.spr: equ #33

  MODULE Chair
    SETUP_CELL_TYPE_N Chair_item_name, script
    SETUP_ITEM_TYPE_N

script:
  IfVar Vars.var_act, do_stand, no_script
  IfVar Vars.var_act, do_get, take_
  goto no_way_script
take_:
  ; ShowText Take_chair_mess
  defb _endByte
  ENDMODULE

ChairWhite.spr: equ 83
  MODULE ChairWhite
    SETUP_CELL_TYPE_N Chair_item_name, Chair.script
  ENDMODULE
