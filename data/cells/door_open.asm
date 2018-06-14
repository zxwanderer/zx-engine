
DoorOpen.spr: equ #22

  MODULE DoorOpen

_temp equ $; запоминаем адрес

    SETUP_CELL_TYPE Door_cell_name, DoorOpen_script

  ORG _temp; восстанавливаем адрес
  
DoorOpen_script:
  shiruFX 38
  defb _endByte

  ENDMODULE
