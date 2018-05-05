MODULE zxengine

start:
  LD HL, START_SCRIPT
process:
  LD A, (HL)
  AND A; _endByte -> 0
  RET Z
  LD DE, (HL)
  INC HL
  PUSH HL ; запоминаем
  PUSH DE ; в DE - адрес процедуры
  RET
  /* JP (HL) */
  /* JR process */
process_ret
  POP HL
  JR process

  /* include "middlware/beeper.asm" */

ENDMODULE
