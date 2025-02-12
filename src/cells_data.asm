  include "CellType_h.asm"
  
; масив типов ячеек
OBJECT_DATA:
  include "types/Empty_cell.asm"
OBJECT_DATA_END equ $-1

; массив ячеек с номерами от 0 до 255
; каждая ячейка ссылается на тип из OBJECT_DATA
CELL_TYPES:
  DUP 256
    dw Empty_cell
  EDUP
CELL_TYPES_END equ $-1

