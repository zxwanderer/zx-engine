  include "CellType_h.asm"
  
; масив типов ячеек
OBJECT_DATA:
  SET_CELL_TYPE Empty_cell, Empty_cell_name, No_action_reaction
OBJECT_DATA_END equ $-1

; массив ячеек с номерами от 0 до 255
; каждая ячейка ссылается на тип из OBJECT_DATA
CELL_TYPES:
  DUP 256
    dw Empty_cell
  EDUP
CELL_TYPES_END equ $-1

Empty_0.spr equ 0
  DEFINE_SPR_CELL Empty_0.spr, Empty_cell
