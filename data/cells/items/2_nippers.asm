
Nippers.item: equ 2
Nippers.spr: equ 60

  MODULE Nippers

  SETUP_CELL_TYPE_N Nippers_item_name, nippers_script
  SETUP_ITEM_TYPE_N

nippers_script:
  IfVar Vars.var_act, do_get, take_nippers_script
  defb _endByte
take_nippers_script:
;   ShowText Take_nippers_mess
  defb _endByte

  ENDMODULE
