Scaf.item: equ 5
Scaf.spr: equ 25

  MODULE Scaf

    SETUP_CELL_TYPE_N Scaf_cell_name, Scaf_script
    SETUP_ITEM_TYPE_N
    
Scaf_script:
  IfVar Vars.var_act, do_get, take_scaf_script
  goto say_no_way

take_scaf_script:
  defb _endByte

  ENDMODULE

