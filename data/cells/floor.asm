
Floor.spr: equ #03

  MODULE Floor
    SETUP_CELL_TYPE_N Floor_cell_name, floor_script
  
floor_script:
  IfVar Vars.var_act, do_get, take_floor_script
  ; IfVarN Vars.var_pos_y, 7, floor_script_normal
  ; SetVar Vars.game_over, 2
  defb _endByte
; floor_script_normal:
  ; defb _endByte
take_floor_script
  ShowText Take_floor_mess
  defb _endByte
  ENDMODULE

FloorWhite.spr: equ #36
  MODULE FloorWhite
    SETUP_CELL_TYPE_N Floor_cell_name, Floor.floor_script
  ENDMODULE

FloorRed.spr: equ #3a
  MODULE FloorRed
    SETUP_CELL_TYPE_N Floor_cell_name, Floor.floor_script
  ENDMODULE

FloorCyan.spr: equ #29
  MODULE FloorCyan
    SETUP_CELL_TYPE_N Floor_cell_name, Floor.floor_script
  ENDMODULE

