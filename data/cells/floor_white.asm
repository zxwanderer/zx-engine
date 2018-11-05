
; Floor.item: equ 1
FloorWhite.spr: equ #36

  MODULE FloorWhite

_temp equ $; запоминаем адрес

    SETUP_CELL_TYPE Floor_cell_name, Floor.floor_script

  ORG _temp; восстанавливаем адрес
  
; floor_script:
;   IfVar Vars.var_act, do_get, take_floor_script
;   ; IfVarN Vars.var_pos_y, 7, floor_script_normal
;   ; SetVar Vars.game_over, 2
;   defb _endByte
; ; floor_script_normal:
;   ; defb _endByte
; take_floor_script
;   ShowText Take_floor_mess
;   defb _endByte


  ENDMODULE
