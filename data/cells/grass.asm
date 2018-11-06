
; --- трава 

Grass.spr: equ #11
  MODULE Grass
    SETUP_CELL_TYPE_N Grass_cell_name, Floor.floor_script
  ENDMODULE

Grass2.spr: equ #20
  MODULE Grass2
    SETUP_CELL_TYPE_N Grass_cell_name, Floor.floor_script
  ENDMODULE

Grass3.spr: equ #10
  MODULE Grass3
    SETUP_CELL_TYPE_N Grass_cell_name, Floor.floor_script
  ENDMODULE

; --- кустарник 

Bush.spr: equ 49
  MODULE Bush
    SETUP_CELL_TYPE_N Bush_cell_name, bush_script
bush_script:
  shiruFX FX_Wall
  CallScript action_ring_explode
  ShowText Bush_mess
  goto no_way_script    
  ENDMODULE

Bush2.spr: equ 48
  MODULE Bush2
    SETUP_CELL_TYPE_N Bush_cell_name, Bush.bush_script
  ENDMODULE

Bush3.spr: equ 64
  MODULE Bush3
    SETUP_CELL_TYPE_N Bush_cell_name, Bush.bush_script
  ENDMODULE

; --- гравий
Gravel.spr: equ 42
  MODULE Gravel
    SETUP_CELL_TYPE_N Gravel_cell_name, Floor.floor_script
  ENDMODULE

; --- песок
Sand.spr: equ 80
  MODULE Sand
    SETUP_CELL_TYPE_N Sand_cell_name, Floor.floor_script
  ENDMODULE

; --- вмятина на земле
CraterSmall.spr: equ 65
  MODULE CraterSmall
    SETUP_CELL_TYPE_N CraterSmall_cell_name, Floor.floor_script
  ENDMODULE

Toilet.spr: equ 102
  MODULE Toilet
    SETUP_CELL_TYPE_N Toilet_cell_name, toilet_script
toilet_script:
  shiruFX FX_Wall
  CallScript action_ring_explode
  ShowText Toilet_mess
  goto no_way_script    
  ENDMODULE

Sink.spr: equ 103
  MODULE Sink
    SETUP_CELL_TYPE_N Sink_cell_name, sink_script
sink_script:
  shiruFX FX_Wall
  CallScript action_ring_explode
  ShowText Sink_mess
  goto no_way_script    
  ENDMODULE

Table.spr: equ 35
  MODULE Table
    SETUP_CELL_TYPE_N Table_cell_name, table_script
table_script:
  shiruFX FX_Wall
  CallScript action_ring_explode
  ShowText Table_mess
  goto no_way_script    
  ENDMODULE

Keramit.spr: equ 175
  MODULE Keramit
    SETUP_CELL_TYPE_N Keramit_cell_name, keramit_script
keramit_script:
  shiruFX FX_Wall
  ; CallScript action_ring_explode
  ShowText Keramit_mess
  goto no_way_script    
  ENDMODULE
