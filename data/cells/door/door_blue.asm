
DoorBlue.spr: equ #8b

  MODULE DoorBlue

; _temp equ $; запоминаем адрес

    SETUP_CELL_TYPE_N Door_cell_name, door_script

  ; ORG _temp; восстанавливаем адрес
  
door_script:
;   shiruFX FX_Nope
;   ShowText Door_not_open_mess
;   goto no_way_script
  shiruFX 43
  SetMapCell DoorBlueOpen.spr
  goto no_way_script

  ENDMODULE