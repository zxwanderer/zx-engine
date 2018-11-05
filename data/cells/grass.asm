
; --- трава 

Grass.spr: equ #11
  MODULE Grass
_temp equ $; запоминаем адрес
    SETUP_CELL_TYPE Grass_cell_name, Floor.floor_script
  ORG _temp; восстанавливаем адрес  
  ENDMODULE

Grass2.spr: equ #20
  MODULE Grass2
_temp equ $; запоминаем адрес
    SETUP_CELL_TYPE Grass_cell_name, Floor.floor_script
  ORG _temp; восстанавливаем адрес
  ENDMODULE

Grass3.spr: equ #10
  MODULE Grass3
_temp equ $; запоминаем адрес
    SETUP_CELL_TYPE Grass_cell_name, Floor.floor_script
  ORG _temp; восстанавливаем адрес
  ENDMODULE

; --- кустарник 

Bush.spr: equ 49
  MODULE Bush
_temp equ $; запоминаем адрес
    SETUP_CELL_TYPE Bush_cell_name, no_way_script
  ORG _temp; восстанавливаем адрес
  ENDMODULE

Bush2.spr: equ 48
  MODULE Bush2
_temp equ $; запоминаем адрес
    SETUP_CELL_TYPE Bush_cell_name, no_way_script
  ORG _temp; восстанавливаем адрес
  ENDMODULE

Bush3.spr: equ 64
  MODULE Bush3
_temp equ $; запоминаем адрес
    SETUP_CELL_TYPE Bush_cell_name, no_way_script
  ORG _temp; восстанавливаем адрес
  ENDMODULE

; --- гравий
Gravel.spr: equ 42
  MODULE Gravel
_temp equ $; запоминаем адрес
    SETUP_CELL_TYPE Gravel_cell_name, Floor.floor_script
  ORG _temp; восстанавливаем адрес
  ENDMODULE

; --- песок
Sand.spr: equ 80
  MODULE Sand
_temp equ $; запоминаем адрес
    SETUP_CELL_TYPE Sand_cell_name, Floor.floor_script
  ORG _temp; восстанавливаем адрес
  ENDMODULE

; --- вмятина на земле
CraterSmall.spr: equ 65
  MODULE CraterSmall
_temp equ $; запоминаем адрес
    SETUP_CELL_TYPE CraterSmall_cell_name, Floor.floor_script
  ORG _temp; восстанавливаем адрес
  ENDMODULE

Toilet.spr: equ 102
  MODULE Toilet
_temp equ $; запоминаем адрес
    SETUP_CELL_TYPE Toilet_cell_name, no_way_script
  ORG _temp; восстанавливаем адрес
  ENDMODULE

Sink.spr: equ 103
  MODULE Sink
_temp equ $; запоминаем адрес
    SETUP_CELL_TYPE Sink_cell_name, no_way_script
  ORG _temp; восстанавливаем адрес
  ENDMODULE

Table.spr: equ 35
  MODULE Table
_temp equ $; запоминаем адрес
    SETUP_CELL_TYPE Table_cell_name, no_way_script
  ORG _temp; восстанавливаем адрес
  ENDMODULE
