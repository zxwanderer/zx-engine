
Scaf.spr: equ 128

  MODULE Scaf

    SETUP_CELL_TYPE_N Scaf_cell_name, script_
    
script_:
  IfVar Vars.var_act, do_stand, no_way_script
  IfVar Vars.var_act, do_get, get_
  IfVar Vars.var_act, do_drop, no_way_script
  defb _endByte

get_:
  SetVar Vars.var_ret, 0
  CallCode binary_check_scaf
  IfVar Vars.var_ret, 0, no_way_script

wear_scaf:
  WearItem Scaf.spr, ScafPlace.spr
  goto no_way_script
  defb _endByte

unwear_scaf:
  WearItem Hero09.spr, Scaf.spr
  goto no_way_script
  defb _endByte

binary_check_scaf: ; Vars.var_ret = 1 - скафандра нет
  LD IX, (Entities.activePersonage_ptr)
  LD A, Scaf.spr
  CP ( IX+Hero.base_spr )
  RET Z
  LD A, HardScaf.spr
  CP ( IX+Hero.base_spr)
  RET Z
  LD A, 1
  setVar Vars.var_ret
  RET

  ENDMODULE

HardScaf.spr: equ 144

  MODULE HardScaf

    SETUP_CELL_TYPE_N HardScaf_cell_name, Scaf.script_

  ENDMODULE
