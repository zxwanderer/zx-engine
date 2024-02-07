BodyYellow.spr: equ 10
  MODULE BodyYellow
    SETUP_CELL_TYPE_N BodyInScaf_cell_name, script

script:
  ; CheckActionReaction _body_action_table
  IfVar Vars.var_act, do_get, body_get_
  IfVar Vars.var_act, do_drop, body_drop_
  goto no_way_script
  defb _endByte

_body_action_table:
  db do_get
  dw body_get_
  db do_drop
  dw try_cut
  defb _endByte

body_get_:
  ShowText Body_no_get
  goto nope_script

_body_drop_table:
  ; IfVar Vars.var_item_id, CanisterEmpty.spr, try_container_get_
  ; IfVar Vars.var_item_id, Wrench.spr, try_cut
  ; IfVar Vars.var_item_id, Shard.spr, try_cut
  ; IfVar Vars.var_item_id, Nippers.spr, try_cut
  ; goto no_way_script

  db CanisterEmpty.spr
  dw try_container_get_
  db Wrench.spr
  dw try_cut
  db Shard.spr
  dw try_cut
  db Nippers.spr
  dw try_cut
  defb _endByte

  ; IfVar Vars.var_item_id, CanisterEmpty.spr, try_container_get_
  ; IfVar Vars.var_item_id, Wrench.spr, try_cut
  ; IfVar Vars.var_item_id, Shard.spr, try_cut
  ; IfVar Vars.var_item_id, Nippers.spr, try_cut
  

body_drop_:
  ; CheckActiveItem _body_drop_table
  IfVar Vars.var_item_id, CanisterEmpty.spr, try_container_get_
  IfVar Vars.var_item_id, Wrench.spr, try_cut
  IfVar Vars.var_item_id, Shard.spr, try_cut
  IfVar Vars.var_item_id, Nippers.spr, try_cut
  goto no_way_script

try_cut:
  shiruFX FX_Cutt1
  SetMapCell Blood.spr
  ShowText Fuu_mainac_mess
  goto no_way_script

try_container_get_:
  ShowText Not_get_body
  shiruFX FX_Nope
  goto no_way_script

  ENDMODULE

BodyWhite.spr: equ 27
  MODULE BodyWhite
    SETUP_CELL_TYPE_N Body_cell_name, BodyYellow.script
  ENDMODULE

BodyBlue.spr: equ 28
  MODULE BodyBlue
    SETUP_CELL_TYPE_N BodyTech_cell_name, BodyYellow.script
  ENDMODULE
