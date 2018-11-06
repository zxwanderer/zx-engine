
; --- трава 

Grass.spr: equ #11
  MODULE Grass
; _temp equ $; запоминаем адрес
    SETUP_CELL_TYPE_N Grass_cell_name, Floor.floor_script
  ; ORG _temp; восстанавливаем адрес  
  ENDMODULE

Grass2.spr: equ #20
  MODULE Grass2
; _temp equ $; запоминаем адрес
    SETUP_CELL_TYPE_N Grass_cell_name, Floor.floor_script
  ; ORG _temp; восстанавливаем адрес
  ENDMODULE

Grass3.spr: equ #10
  MODULE Grass3
; _temp equ $; запоминаем адрес
    SETUP_CELL_TYPE_N Grass_cell_name, Floor.floor_script
  ; ORG _temp; восстанавливаем адрес
  ENDMODULE

; --- кустарник 

Bush.spr: equ 49
  MODULE Bush
; _temp equ $; запоминаем адрес
    SETUP_CELL_TYPE_N Bush_cell_name, bush_script
  ; ORG _temp; восстанавливаем адрес
bush_script:
  shiruFX FX_Wall
  CallScript action_ring_explode
  ShowText Bush_mess
  goto no_way_script    
  ENDMODULE

Bush2.spr: equ 48
  MODULE Bush2
; _temp equ $; запоминаем адрес
    SETUP_CELL_TYPE_N Bush_cell_name, Bush.bush_script
  ; ORG _temp; восстанавливаем адрес
  ENDMODULE

Bush3.spr: equ 64
  MODULE Bush3
; _temp equ $; запоминаем адрес
    SETUP_CELL_TYPE_N Bush_cell_name, Bush.bush_script
  ; ORG _temp; восстанавливаем адрес
  ENDMODULE

; --- гравий
Gravel.spr: equ 42
  MODULE Gravel
; _temp equ $; запоминаем адрес
    SETUP_CELL_TYPE_N Gravel_cell_name, Floor.floor_script
  ; ORG _temp; восстанавливаем адрес
  ENDMODULE

; --- песок
Sand.spr: equ 80
  MODULE Sand
; _temp equ $; запоминаем адрес
    SETUP_CELL_TYPE_N Sand_cell_name, Floor.floor_script
  ; ORG _temp; восстанавливаем адрес
  ENDMODULE

; --- вмятина на земле
CraterSmall.spr: equ 65
  MODULE CraterSmall
; _temp equ $; запоминаем адрес
    SETUP_CELL_TYPE_N CraterSmall_cell_name, Floor.floor_script
  ; ORG _temp; восстанавливаем адрес
  ENDMODULE

Toilet.spr: equ 102
  MODULE Toilet
; _temp equ $; запоминаем адрес
    SETUP_CELL_TYPE_N Toilet_cell_name, toilet_script
  ; ORG _temp; восстанавливаем адрес
toilet_script:
  shiruFX FX_Wall
  CallScript action_ring_explode
  ShowText Toilet_mess
  goto no_way_script    
  ENDMODULE

Sink.spr: equ 103
  MODULE Sink
; _temp equ $; запоминаем адрес
    SETUP_CELL_TYPE_N Sink_cell_name, sink_script
  ; ORG _temp; восстанавливаем адрес
sink_script:
  shiruFX FX_Wall
  CallScript action_ring_explode
  ShowText Sink_mess
  goto no_way_script    
  ENDMODULE

Table.spr: equ 35
  MODULE Table
; _temp equ $; запоминаем адрес
    SETUP_CELL_TYPE_N Table_cell_name, table_script
  ; ORG _temp; восстанавливаем адрес    
table_script:
  shiruFX FX_Wall
  CallScript action_ring_explode
  ShowText Table_mess
  goto no_way_script    
  ENDMODULE

Keramit.spr: equ 175
  MODULE Keramit
; _temp equ $; запоминаем адрес
    SETUP_CELL_TYPE_N Keramit_cell_name, keramit_script
  ; ORG _temp; восстанавливаем адрес    
keramit_script:
  shiruFX FX_Wall
  ; CallScript action_ring_explode
  ShowText Keramit_mess
  goto no_way_script    
  ENDMODULE
