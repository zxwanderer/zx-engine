  include "CellType_h.asm"
  
OBJECT_DATA:
  SET_CELL_TYPE Empty_cell, Empty_cell_name, No_action_reaction
OBJECT_DATA_END equ $-1

CELL_TYPES:
  DUP 256
    CellType Empty_cell_name, no_way_script
    ; defb 00
  EDUP
CELL_TYPES_END equ $

; CELL_TYPES:
;   DUP 256
;     dw Empty_cell
;   EDUP
; CELL_TYPES_END equ $-1

Empty_0.spr equ 0
  DEFINE_SPR_CELL Empty_0.spr, Empty_cell

No_action_reaction:
  defb 00
