
DoorWhite.spr: equ #7b

  MODULE DoorWhite

; _temp equ $; запоминаем адрес

    SETUP_CELL_TYPE_N Door_cell_name, door_script

  ; ORG _temp; восстанавливаем адрес
  
door_script:
;   shiruFX FX_Nope
;   ShowText Door_not_open_mess
;   goto no_way_script

; door_do_open:
  shiruFX 43
;   FxActionCell Door_half_open
;   wait_halt 3
  SetMapCell DoorWhiteOpen.spr
  goto no_way_script

  ENDMODULE
