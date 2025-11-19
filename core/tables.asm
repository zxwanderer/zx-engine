  include "h_push_pop.asm"

; Найти запись по индексу в таблице вида [#index][#pointer]
; Если индекс найден то в HL возвращается указатель #pointer

; На входе:
;   A - индекс
;   HL - указатель на таблицу
; На выходе:
;   HL - найденное значения
;   retFalse - если не нашли Carry = 0
TABLE_SCAN_BY_INDEX_PTR:
  LD (.index_set+1), A

.loop
  LD A, (HL)
  AND A  ;проверяем на 0
  JP Z, Entities.check_act_no

.index_set:
  CP #00
  JR Z, .found
  INC HL
  INC HL
  INC HL
  JR .loop

.found:
  INC HL ; передвигаем с действия на указатель
  HL_PTR_TO_HL
  ret_true
