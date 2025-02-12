; --- песок
Sand.spr: equ 80
  MODULE Sand
    SETUP_CELL_TYPE_N Sand_cell_name, script

script:
    IfVarN Vars.var_act, do_stand, Floor.script
    ; проверяем есть ли скафандр
    GetWearItem
    IfVar Vars.var_ret, Scaf.spr, script_next
    IfVar Vars.var_ret, HardScaf.spr, script_next
    ; если скафандра нет - хеппи-энд!
    SetVar Vars.game_over, 5
    goto no_way_script

script_next:
; проверяем что встали на позицию 31,31
    IfVarN Vars.var_pos_y, 31, Floor.script
    IfVarN Vars.var_pos_x, 31, Floor.script
; тут только в случае если встаем на ячейку 31,31
    GetWearItem
    IfVar Vars.var_ret, HardScaf.spr, happy_end_game
    ShowText Not_away_from_base
    shiruFX FX_Nope
    CallCode input.noKey
    CallCode input.waitKey
    goto no_way_script

happy_end_game:
    SetVar Vars.game_over, 4
    goto no_way_script
    ; goto no_script


  ENDMODULE
