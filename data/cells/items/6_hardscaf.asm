HardScaf.item: equ 5
HardScaf.spr: equ 144

  MODULE HardScaf

    SETUP_CELL_TYPE_N HardScaf_cell_name, script
    SETUP_ITEM_TYPE_N

script:
  IfVar Vars.var_act, do_get, get_ ; get у нас особый 
  goto Scaf.script
;   defb _endByte
get_:
  goto no_script
; drop_:
;   goto no_way_script

  ENDMODULE
