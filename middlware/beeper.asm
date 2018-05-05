MODULE beeper

  MACRO setBorder color
    defw beeper.set_border
    defb color
  ENDM

set_border:
  LD A,(HL)
  INC HL
  OUT (#FE), A
  JP zxengine.process

ENDMODULE
