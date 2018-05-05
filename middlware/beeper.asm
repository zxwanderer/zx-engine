MODULE beeper

  MACRO setBorder color
    defw beeper.set_border
    defb color
  ENDM

set_border:
  OUT (#FE), A
  RET

ENDMODULE
