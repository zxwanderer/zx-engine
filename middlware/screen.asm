MODULE screen

  MACRO setScreen inc_
    defw screen.set_colors
    defb inc_
  ENDM

  MACRO setStatic
    defw screen.statica
  ENDM

set_colors:
  mLDA
  PUSH HL

  LD HL,ATTR_ADDR
  LD (HL),A
  LD DE,ATTR_ADDR+1
  LD BC,768
  LDIR
  /* LD (set_colors_loop+1),A
  LD HL,ATTR_ADDR
set_colors_loop:
  LD (HL), 0
  INC HL
  LD A,H
  CP #5B
  JR NZ,set_colors_loop */

  POP HL
  JP zxengine.process

statica:
  PUSH HL
  XOR A
  LD C,A
  LD E,A
  LD H,#18
  LD B,H
  LD H,E
  LD D,#40
  LD L,A
  ADD A
  ADD A
  ADD L
  INC A
  LDIR
  POP HL
  JP zxengine.process

ENDMODULE

/*
  ld HL,ATTR_ADDR
  LD C,24
set_colors_loop:
  LD B,32:
set_colors_loop_2:
  LD (HL),A
  INC HL
  DJNZ set_colors_loop_2     ;столбцы
  // sub 8
  // and 56 // если включить то будет радуга %)
  DEC C
  JR NZ,set_colors_loop                        ;строки
*/
