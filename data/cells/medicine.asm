
Anabiose.spr: equ 98
  MODULE Anabiose
    SETUP_CELL_TYPE_N Anabiose_cell_name, script

script:
  IfVarN Vars.var_act, do_get, no_way_script
  ; goto no_way_script    
open:
  SetMapCell AnabioseOff.spr
  shiruFX FX_DoorOpen
  ShowText Anaboise_do_open
  SetMapCellOnHero Blood.spr
  ; CallCode Entities.lookChar
  goto no_way_script
  ENDMODULE

AnabioseOff.spr: equ 82
  MODULE AnabioseOff
    SETUP_CELL_TYPE_N AnabioseOpen_cell_name, no_way_script
  ENDMODULE

Mentoscanner.spr: equ 59
  MODULE Mentoscanner
    SETUP_CELL_TYPE_N Mentoscanner_cell_name, no_way_script

; Mentoscanner_break_script
  ; shiruFX FX_Boom
  ; CallScript action_ring_explode
  ; ShowText Mentoscanner_kick_mess
  ; SetMapCell ElectonicDestroy.spr
  ; goto no_way_script
; Mentoscanner_kick_mess
  ENDMODULE

MentoscannerOn.spr: equ 56
  MODULE MentoscannerOn
    SETUP_CELL_TYPE_N Mentoscanner_cell_name, no_way_script
  ENDMODULE

; Medicbox.spr: equ 53
;   MODULE Medicbox
;     SETUP_CELL_TYPE_N Medicbox_cell_name, no_way_script
;   ENDMODULE
