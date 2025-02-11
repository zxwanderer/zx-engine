; --- вмятина на земле
CraterSmall.spr: equ 65
  MODULE CraterSmall
    SETUP_CELL_TYPE_N CraterSmall_cell_name, Floor.script

; script:
;     IfVarN Vars.var_act, do_stand, Floor.script
;     IfVarN Vars.var_pos_y, 31, Floor.script
;     IfVarN Vars.var_pos_x, 31, Floor.script
; ; тут только в случае если встаем на ячейку 31,31
;     GetWearItem
;     IfVar Vars.var_ret, HardScaf.spr, happy_end_game
;     ShowText Not_away_from_base
;     shiruFX FX_Nope
;     CallCode input.noKey
;     CallCode input.waitKey
;     goto no_way_script

; happy_end_game:
;     SetVar Vars.game_over, 4
;     goto no_way_script
;     ; goto no_script

  ENDMODULE
