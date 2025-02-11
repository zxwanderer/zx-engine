
Bed.spr equ 19

  MODULE Bed

  SETUP_CELL_TYPE_N Bed_cell_name, script

script:
  IfVar Vars.var_act, do_get, get_
  IfVar Vars.var_act, do_drop, drop_
  ; FxActionCell Ring_expl_1
  defb _endByte

drop_:
  IfVar Vars.var_item_id, Nippers.spr, Table.break_table
  IfVar Vars.var_item_id, Wrench.spr, Table.break_table
  defb _endByte

get_:
  ShowText Take_bed_mess
  shiruFX 10
  goto no_way_script

  ENDMODULE
