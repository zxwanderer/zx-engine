BodyYellow.spr: equ 10
  MODULE BodyYellow
    SETUP_CELL_TYPE_N BodyInScaf_cell_name, script

script:
  CheckActionReaction _body_action_table
  goto no_way_script

_body_action_table:
  SetIndexPointer do_get, body_get_
  SetIndexPointer do_drop, body_drop_
  SetIndexPointer do_stand, no_script
  defb _endByte

body_get_:
  ShowText Body_no_get
  goto nope_script

body_drop_:
  CheckActiveItem _body_drop_table
  goto nope_script

_body_drop_table:
  SetIndexPointer CanisterEmpty.spr, try_container_get_
  SetIndexPointer Wrench.spr, try_cut_
  SetIndexPointer Shard.spr, try_cut_
  SetIndexPointer Nippers.spr, try_cut_
  defb _endByte

try_cut_:
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
