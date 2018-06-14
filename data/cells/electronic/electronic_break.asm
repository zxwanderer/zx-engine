
ElectronicBreak.spr: equ #28

  MODULE ElectronicBreak

_temp equ $; запоминаем адрес

    SETUP_CELL_TYPE Electronic_break_name, electronic_break_script

  ORG _temp; восстанавливаем адрес
  
electronic_break_script
  shiruFX FX_Wall
  CallScript action_ring_explode
  ShowText Electronic_break_mess
  SetMapCell Wall.spr
  goto no_way_script

  ENDMODULE
