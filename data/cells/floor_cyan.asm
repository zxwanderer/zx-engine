
FloorCyan.spr: equ #29

  MODULE FloorCyan

_temp equ $; запоминаем адрес

    SETUP_CELL_TYPE Floor_cell_name, Floor.floor_script

  ORG _temp; восстанавливаем адрес
  
  ENDMODULE

