; --- песок
Sand.spr: equ 80
  MODULE Sand
    SETUP_CELL_TYPE_N Sand_cell_name, script

script:
    IfVarN Vars.var_act, do_stand, Floor.script
    ; проверяем есть ли скафандр
    GetWearItem
    IfVar Vars.var_ret, Scaf.spr, Floor.script
    IfVar Vars.var_ret, HardScaf.spr, Floor.script
    ; если скафандра нет - хеппи-энд!
    SetVar Vars.game_over, 5
    goto no_way_script


  ENDMODULE
