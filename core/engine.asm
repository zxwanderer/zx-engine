MODULE zxengine

  MACRO stop
    defw zxengine.stop_me
  ENDM

  MACRO goto addr
    defw zxengine.goto_me
    defw addr
  ENDM

  MACRO wait num
    defw zxengine.wait_me
    defb num
  ENDM

  MACRO CallCode ptr
    defw zxengine.call_code_me
    defw ptr
  ENDM

start:
  EI
  LD HL, START_SCRIPT
process:
  LD A, (HL)
  AND A; _endByte -> 0
  RET Z
  LD E,A
  INC HL
  LD D,(HL)
  INC HL
  LD (process_goto+1), DE
process_goto:
  JP #0000 // в DE - указатель на данные

call_code_me:
  mLDE
  PUSH HL
  EX HL,DE
  CALL callHL
  POP HL
  JP process

callHL  JP (hl)

goto_me:
  LD DE, (HL)
  EX HL, DE
  JP process

halt_me:
  HALT
  RET

wait_me:
  LD B, (HL)
  INC HL
wait_me_loop:
  /* HALT */
  NOP
  DJNZ wait_me_loop
  JP process

ENDMODULE
