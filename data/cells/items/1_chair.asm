
Chair.item: equ 1
Chair.spr: equ #33

  MODULE Chair
    SETUP_CELL_TYPE_N Chair_item_name, script
    SETUP_ITEM_TYPE_N

script:
  IfVar Vars.var_act, do_stand, no_script
  IfVar Vars.var_act, do_get, take_
  IfVar Vars.var_act, do_drop, drop_
  goto no_way_script
take_:
  ; ShowText Take_chair_mess
  defb _endByte
drop_:
  IfVar Vars.var_item_id, Nippers.spr, destroy_
  goto no_way_script

destroy_:
  CallCode items.self_destroy_item
  shiruFX FX_Wall
  CallScript action_ring_explode
  SetMapCell Trash.spr
  goto no_way_script
  ENDMODULE

ChairWhite.spr: equ 83
  MODULE ChairWhite
    SETUP_CELL_TYPE_N Chair_item_name, Chair.script
  ENDMODULE
