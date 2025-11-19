Table.spr: equ 35

  MODULE Table

    SETUP_CELL_TYPE_N Table_cell_name, table_script

table_script:
  IfVar Vars.var_act, do_drop, drop_table_script
  IfVar Vars.var_act, do_stand, no_way_script
  defb _endByte

drop_table_script:
  IfVar Vars.var_item_id, Shard.spr, base_kick_shard_fault
  IfVar Vars.var_item_id, Nippers.spr, break_table
  IfVar Vars.var_item_id, Wrench.spr, break_table
  goto no_way_script

break_table:
  shiruFX FX_Wall
  CallScript action_ring_explode
  SetMapCell Trash.spr
  goto need_look_no_way

  ENDMODULE

WhiteTable.spr: equ 81

  MODULE WhiteTable

    SETUP_CELL_TYPE_N Table_cell_name, Table.table_script

  ENDMODULE
