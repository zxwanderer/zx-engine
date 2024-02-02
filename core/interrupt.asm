
  include "h_push_pop.asm"

  MODULE interrupt

init: ;инициализация прерываний, из Survivesection
  DI
  LD HL,INT_VECTOR
  LD B,0
  LD A, (high INT_VECTOR)+1
init_loop:
  LD (HL),A
  INC HL
  DJNZ init_loop
  LD (HL),A
  LD H,(high INT_VECTOR)+1
  LD L,H
  LD (HL),#C3
  INC HL
  LD DE,interrupt_routine
  LD (HL),E
  INC HL
  LD (HL),D
  LD A,high INT_VECTOR
  LD I,A
  IM 2
  EI
  RET

interrupt_routine:
  DI
  DO_PUSH_ALL_REGISTRY
  
  ; LD A,1
  ; OUT(#FE),A

  LD HL, (frame_counter)
  INC HL
  LD (frame_counter), HL

  ; LD A,0
  ; OUT(#FE),A

  ; CALL cursor.show_cursor
  ; show_cursor

  ; CALL screenfx.show_frames
return_routine:
  DO_POP_ALL_REGISTRY
  EI
  ret

frame_counter:
  dw 0

interrupt_end
  ENDMODULE
