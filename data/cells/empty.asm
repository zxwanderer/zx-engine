
Empty.spr: equ #00

  MODULE Empty

_temp equ $; запоминаем адрес

    SETUP_CELL_TYPE Empty_cell_name, empty_script

  ORG _temp; восстанавливаем адрес

empty_script:
  ; IfVarN Vars.var_pos_y, 7, no_script
  ; SetVar Vars.game_over, 2
  ; goto no_script
  defb _endByte

  ENDMODULE
