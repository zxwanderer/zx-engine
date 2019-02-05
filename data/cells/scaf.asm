
Scaf.spr: equ 128

  MODULE Scaf

    SETUP_CELL_TYPE_N Scaf_cell_name, script_

script_:

  IfVar Vars.var_act, do_get, get_
  IfVar Vars.var_act, do_drop, no_way_script
  goto no_way_script

get_:
  SetVar Vars.var_ret, 0
  CallCode binary_check_scaf
  IfVar Vars.var_ret, 0, no_way_script

wear_scaf:
  CallCode binary_wear_scaf
  goto no_way_script

unwear_scaf:
  CallCode binary_unwear_scaf ;  мы можем одеть два вида скафаднра приходится делать универсальную процедуру
  goto no_way_script

binary_wear_scaf:
  LD HL, (Entities.MapCell_ptr)
  LD A, (HL)
  LD B, A
  LD C, ScafPlace.spr
  JP Entities.wear_item
  
binary_unwear_scaf:
  LD IX, (Entities.activePersonage_ptr)
  LD A, ( IX+Hero.base_spr ) ; запомнили одежду
  LD C, A
  LD B, Hero09.spr
  JP Entities.wear_item
  ; RET

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

  ; DISPLAY "binary_wear_scaf ", Scaf.binary_wear_scaf
  ; DISPLAY "MAP_SET", MAP_SET
  ; DISPLAY "MapCell_xy", Vars.MapCell_xy
  ; DISPLAY "zxengine.varsTab", zxengine.varsTab
  ; DISPLAY "zxengine.varsTab+Vars.var_item_id", zxengine.varsTab+Vars.var_item_id
