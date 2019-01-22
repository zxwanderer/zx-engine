
; --- трава 

Grass.spr: equ #11
  MODULE Grass
    SETUP_CELL_TYPE_N Grass_cell_name, Floor.script
  ENDMODULE

Grass2.spr: equ #20
  MODULE Grass2
    SETUP_CELL_TYPE_N Grass_cell_name, Floor.script
  ENDMODULE

Grass3.spr: equ #10
  MODULE Grass3
    SETUP_CELL_TYPE_N Grass_cell_name, Floor.script
  ENDMODULE

; --- кустарник 
Bush.spr: equ 49
  MODULE Bush
    SETUP_CELL_TYPE_N Bush_cell_name, script
script:
  IfVar Vars.var_act, do_stand, no_way_script
  IfVar Vars.var_act, do_get, base_kick_fault
  IfVar Vars.var_act, do_drop, drop_
  defb _endByte

drop_:
  IfVar Vars.var_item_id, Nippers.spr, cut_
  goto base_kick_fault

cut_:
  shiruFX FX_Wall
  CallScript action_ring_explode
  SetMapCell Acid.spr
  goto no_way_script
  ENDMODULE

Bush2.spr: equ 48
  MODULE Bush2
    SETUP_CELL_TYPE_N Bush_cell_name, Bush.script
  ENDMODULE

Bush3.spr: equ 64
  MODULE Bush3
    SETUP_CELL_TYPE_N Bush_cell_name, Bush.script
  ENDMODULE

; --- гравий
Gravel.spr: equ 42
  MODULE Gravel
    SETUP_CELL_TYPE_N Gravel_cell_name, Floor.script
  ENDMODULE

; --- песок
Sand.spr: equ 80
  MODULE Sand
    SETUP_CELL_TYPE_N Sand_cell_name, Floor.script
  ENDMODULE

PlantPot.spr: equ 24
  MODULE PlantPot
    SETUP_CELL_TYPE_N PlantPot_cell_name, Bush.script
  ENDMODULE

; --- вмятина на земле
CraterSmall.spr: equ 65
  MODULE CraterSmall
    SETUP_CELL_TYPE_N CraterSmall_cell_name, Floor.script
  ENDMODULE

; Toilet.spr: equ 102
;   MODULE Toilet
;     SETUP_CELL_TYPE_N Toilet_cell_name, no_way_script
;   ENDMODULE

; Sink.spr: equ 103
;   MODULE Sink
;     SETUP_CELL_TYPE_N Sink_cell_name, no_way_script
; sink_script:
;   ENDMODULE

Keramit.spr: equ 175
  MODULE Keramit
    SETUP_CELL_TYPE_N Keramit_cell_name, no_way_script
; keramit_script:
  ; shiruFX FX_Wall
  ; ShowText Keramit_mess
  ; goto no_way_script    
  ENDMODULE
