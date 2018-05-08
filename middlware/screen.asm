MODULE screen

  MACRO setScreen inc_
    defw screen.set_colors
    defb inc_
  ENDM

set_colors:
  mLDA
  PUSH HL
  LD HL,#5AFF
set_colors_loop:
  LD (HL),A
  DEC HL
  BIT 6,H
  JR NZ,set_colors_loop
  POP HL
  JP zxengine.process
ENDMODULE
