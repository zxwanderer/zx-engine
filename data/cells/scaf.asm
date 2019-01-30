
Scaf.spr: equ 128

  MODULE Scaf

    SETUP_CELL_TYPE_N Scaf_cell_name, script_
    
script_:
  IfVar Vars.var_act, do_stand, no_way_script
  IfVar Vars.var_act, do_get, get_
  IfVar Vars.var_act, do_drop, drop_
  defb _endByte

get_:
  SetVar Vars.var_ret, 0
  CallCode binary_check_scaf
  IfVar Vars.var_ret, 0, no_way_script

wear_scaf:
  WearItem Scaf.spr, ScafPlace.spr
  goto no_way_script
  defb _endByte

drop_:
  goto no_way_script

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

; binary_wear_scaf:
;   LD IX, (Entities.activePersonage_ptr)
;   LD A, Scaf.spr
;   LD ( IX + Hero.sprite ), A
;   LD ( IX + Hero.base_spr), A
;   CALL Entities.lookChar
;   RET

; binary_drop_scaf:
;   LD IX, (Entities.activePersonage_ptr)
;   LD A, Hero09.spr
;   LD ( IX + Hero.sprite ), A
;   LD ( IX + Hero.base_spr), A
;   CALL Entities.lookChar
;   RET

  ENDMODULE

HardScaf.spr: equ 144

  MODULE HardScaf

    SETUP_CELL_TYPE_N HardScaf_cell_name, Scaf.script_
    ; SETUP_ITEM_TYPE_N

; script:
;   IfVar Vars.var_act, do_get, get_ ; get у нас особый 
;   goto Scaf.script
; ;   defb _endByte
; get_:
;   goto no_script
; drop_:
;   goto no_way_script

  ENDMODULE
