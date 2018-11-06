
DoorWhiteOpen.spr: equ #7c

  MODULE DoorWhiteOpen

    SETUP_CELL_TYPE_N Door_cell_name, DoorOpen.DoorOpen_script
  
; door_script:
;   shiruFX FX_Nope
;   ShowText Door_not_open_mess
;   goto no_way_script

; door_do_open:
;   shiruFX 43
;   FxActionCell Door_half_open
;   wait_halt 3
;   SetMapCell DoorOpen.spr
;   goto no_way_script

  ENDMODULE
