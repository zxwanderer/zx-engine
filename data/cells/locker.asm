
Locker.spr: equ 70
  MODULE Locker
; _temp equ $; запоминаем адрес
    SETUP_CELL_TYPE_N Locker_cell_name, locker_script
;   ORG _temp; восстанавливаем адрес
locker_script:
  shiruFX FX_Wall
  CallScript action_ring_explode
  ShowText Locker_mess
  goto no_way_script
  ENDMODULE

LockerBig.spr: equ 69
  MODULE LockerBig
; _temp equ $; запоминаем адрес
    SETUP_CELL_TYPE_N Locker_cell_name, Locker.locker_script
;   ORG _temp; восстанавливаем адрес
  ENDMODULE

LockerSafe.spr: equ 85
  MODULE LockerSafe
; _temp equ $; запоминаем адрес
    SETUP_CELL_TYPE_N Safe_cell_name, safe_script
;   ORG _temp; восстанавливаем адрес
safe_script:
  shiruFX FX_Wall
  CallScript action_ring_explode
  ShowText Safe_mess
  goto no_way_script
  ENDMODULE