include "../core/routines/text68.asm"

MODULE text

  MACRO printAt posx,posy,ptext
    defw text.print_at
    defb posx, posy
    defw ptext
  ENDM

print_at:
  mLDE
  mLBC
  PUSH HL ; запомнили указатель скрипта
  PUSH BC
  POP HL
  ; у нас в DE координаты
  CALL math.pos_scr; рассчитали адрес на экране по координатам
  ; в HL - указатель на текст
  CALL Text68.print_68at
  POP HL
  JP zxengine.process

ENDMODULE
