
Locker.spr: equ 70
  MODULE Locker
    SETUP_CELL_TYPE_N Locker_cell_name, no_way_script
locker_script:
  shiruFX FX_Wall
  CallScript action_ring_explode
  ShowText Locker_mess
  goto no_way_script
  ENDMODULE

LockerBig.spr: equ 69
  MODULE LockerBig
    SETUP_CELL_TYPE_N Locker_cell_name, no_way_script
  ENDMODULE

LockerSafe.spr: equ 85
  MODULE LockerSafe
    SETUP_CELL_TYPE_N Safe_cell_name, no_way_script
safe_script:
  shiruFX FX_Wall
  CallScript action_ring_explode
  ShowText Safe_mess
  goto no_way_script
  ENDMODULE