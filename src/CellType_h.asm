  ifndef __CELL_TYPE_H_
  define __CELL_TYPE_H_

; тип ячейки на карте или предмета
  STRUCT CellType  
name_ptr dw 0000; указатель на текстовое описание типа, должен идти первым, так как это учитывается в процедурах вывода информации
script_ptr dw 0000; указатель на таблицу action-reaction
; material db 00; разные битовые флаги материала - [7][6][5][4][3][2][горит][непрозрачен] etc...
;--- разные части
;prot db 00; проницаемость для предметов, 00 - полностью проницаем
;force_destr db 00; сила для уничтожения
  ENDS

; actions-reactions table:
; action: db #00
; reaction_table: dw #0000

; reaction-on-item table:
; item_in_hand: dw #0000    - 0000 - это значит для всех предметов в руке
; reaction_script: dw #0000
  MACRO DEFINE_SPR_CELL spr_num?, cell_type_ptr?
.temp equ $; запоминаем адрес
    ORG CELL_TYPES + spr_num?*2
    display 'DEFINE_SPR_CELL ', spr_num? , ' -> ', $ , '(', CELL_TYPES, ')'
    dw cell_type_ptr?
    ORG .temp
  ENDM 

  MACRO SET_CELL_TYPE type?, name_ptr?, action_reaction_table_ptr?
type?
      CellType name_ptr?, action_reaction_table_ptr?
      display 'SET_CELL_TYPE: ', type?, ' name: ', name_ptr?, ' action table: ', action_reaction_table_ptr?
  ENDM
  
  ; MACRO SETUP_CELL_TYPE_N _spr, _name, _action_reaction_table
; .temp equ $; запоминаем адрес
    ; ORG CELL_TYPES + _spr*CellType
    ; CellType _name, _action_reaction_table
    ; ORG .temp
  ; ENDM

  MACRO SET_ACTION_REACTON _act?, _react?
    defb _act?
    defw _react?
    display 'SET_ACTION_REACTON: ', _act?, ' react: ', _react?
  ENDM

  endif
