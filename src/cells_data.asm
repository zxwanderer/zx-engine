  include "CellType_h.asm"
  
OBJECT_DATA:
  SET_CELL_TYPE Empty_cell, Empty_cell_name, No_action_reaction
OBJECT_DATA_END equ $-1

CELL_TYPES:
  DUP 256
    dw Empty_cell
  EDUP
CELL_TYPES_END equ $-1

; -------------------------------------------
; Получить указатель на описание ячейки по ее номеру
; Константы:
;   CellType - размер структуры описания ячейки
;   OBJECT_DATA - указатель на массив с описаниями ячеек
; На входе
;   A - номер ячейки (от 0 до #FF)
; На выходе
;   HL - указатель на описание ячейки
; -------------------------------------------
get_by_index:
  LD (.index_ptc_cell+1), A
.index_ptc_cell
  LD HL, #0000
  AND A ; обнуляем флаг переноса
  RL L
  RL H
  ; LD DE, CellType
  ; CALL mul_ADE
  LD DE, CELL_TYPES
  ADD HL, DE
  HL_PTR_TO_HL
  RET

Empty_0.spr equ 0
  DEFINE_SPR_CELL Empty_0.spr, Empty_cell

No_action_reaction:
  defb 00
