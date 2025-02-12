  ifndef __CELL_TYPE_ASM_
  define __CELL_TYPE_ASM_

  MODULE CellType

; ----------------------------------------------------
; Получить указатель на описание ячейки по ее номеру
; Константы:
;   CELL_TYPES - указатель на массив с указателями на описание ячеек
; На входе
;   A - номер ячейки (от 0 до #FF)
; На выходе
;   HL - указатель на описание ячейки
; ------------------------------------------------------
get_by_index:
  LD (.index_ptc_cell+1), A
.index_ptc_cell
  LD HL, #0000
  AND A ; обнуляем флаг переноса
  RL L
  RL H
  LD DE, CELL_TYPES
  ADD HL, DE
  HL_PTR_TO_HL
  RET

  ENDMODULE

  endif
