ORG  #E000
  MODULE interrupt

interrupt_begin:
  DEFS 257,#E1
/*
  MACRO interrupt.init
  DI
  LD   A,#E0
  LD   I,A
  IM   2
  EI
  ENDM
*/

ORG  #E1E1
interrupt_routine:
  DI
  ; push af             ; preserve registers.
  ; push bc
  ; push de
  ; push hl
  ; push ix
  ; push iy
  ; LD A,R
  ; OUT(#FE),A
  ; LD HL, frame_counter
  ; INC (HL)
return_routine:
  ; pop iy
  ; pop ix             ; restore registers.
  ; pop hl
  ; pop de
  ; pop bc
  ; pop af
  EI
  ret

frame_counter:
  dw 0

interrupt_end
  ENDMODULE
