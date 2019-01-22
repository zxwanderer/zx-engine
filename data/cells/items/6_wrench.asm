Wrench.item: equ 6
Wrench.spr: equ 61

  MODULE Wrench

    SETUP_CELL_TYPE_N Wrench_cell_name, Wrench_script
    SETUP_ITEM_TYPE_N
    
Wrench_script:
  IfVar Vars.var_act, do_get, Wrench_take_script
  defb _endByte

Wrench_take_script:
  defb _endByte

  ENDMODULE

