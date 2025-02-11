; --- посадочная площадка
AirLand.spr: equ 37
  MODULE AirLand
    SETUP_CELL_TYPE_N AirLand_cell_name, Floor.script
  ENDMODULE

NavLight.spr: equ 177
  MODULE NavLight
    SETUP_CELL_TYPE_N NavLight_cell_name, no_way_script
  ENDMODULE
