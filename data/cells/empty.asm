
Empty.spr: equ #00

  MODULE Empty

_temp equ $; запоминаем адрес

    SETUP_CELL_TYPE Empty_cell_name, no_script

  ORG _temp; восстанавливаем адрес


  ENDMODULE
