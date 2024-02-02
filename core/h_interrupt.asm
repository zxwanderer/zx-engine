 		ifndef _INTERRUPT_H_
  	define _INTERRUPT_H_

  include "h_push_pop.asm"
INT_TABLE_h equ high INT_TABLE
INT_TABLE_h_1 equ INT_TABLE_h + 1

INT_VECTOR equ INT_TABLE_h_1 * 256 + INT_TABLE_h_1

  ; ORG  #8000
  ; DEFS 257,#81 ; в ALASMe заполняет 257 байт кодом #81
     
  MACRO FILL_INTERRUPT_TABLE __tab_addr, __vector
    ORG  __tab_addr
    DEFS 257, __vector
  ENDM

  MACRO BEGIN_INTERRUPT_ROUTINES __vector
    ORG  __vector * 256 + __vector
    DI
    DO_PUSH_ALL_REGISTRY
  ENDM

  MACRO END_INTERRUPT_ROUTINES
    DO_POP_ALL_REGISTRY
    EI
    RET
  ENDM

  MACRO IM2_ON __vector
    DI
    LD A, __vector
    LD I,A
    IM 2
  ENDM
    endif
