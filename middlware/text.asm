MODULE text

  MACRO printAt posx,posy,ptext
    defw text.print_at_me
    defb posx, posy
    defw ptext
  ENDM

include "../core/routines/text68.asm"

print_at_me:
  mLDE
  mLBC
  PUSH HL ; запомнили указатель скрипта
  PUSH BC
  POP HL
  CALL print_at
  POP HL
  JP zxengine.process

  ; На входе 
  ; в DE координаты XY
  ; в HL - указатель на текст
print_at:
  CALL math.pos_scr; рассчитали адрес на экране по координатам
  CALL Text68.print_68at
  RET

ENDMODULE
