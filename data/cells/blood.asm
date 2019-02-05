Blood.spr: equ 97
  MODULE Blood
    SETUP_CELL_TYPE_N Blood_cell_name, script

script: 
    IfVar Vars.var_act, do_drop, Acid.drop_
    goto Floor.script
  ENDMODULE
