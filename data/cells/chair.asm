
Chair.item: equ 1
Chair.spr: equ #33

  MODULE Chair
    SETUP_CELL_TYPE_N Chair_item_name, chair_script
    SETUP_ITEM_TYPE_N

chair_script:
  IfVar Vars.var_act, do_get, take_chair_script
  defb _endByte
take_chair_script:
  ShowText Take_chair_mess
  defb _endByte
  ENDMODULE

ChairWhite.spr: equ 83
  MODULE ChairWhite
    SETUP_CELL_TYPE_N Chair_item_name, Chair.chair_script
  ENDMODULE
