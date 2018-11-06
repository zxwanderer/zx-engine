
DoorBlueOpen.spr: equ #8c

  MODULE DoorBlueOpen

; _temp equ $; запоминаем адрес

    SETUP_CELL_TYPE_N Door_cell_name, DoorOpen.DoorOpen_script

  ; ORG _temp; восстанавливаем адрес
  
; door_script:
;   shiruFX FX_Nope
;   ShowText Door_not_open_mess
;   goto no_way_script

  ENDMODULE