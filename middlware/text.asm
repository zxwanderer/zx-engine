MODULE text

  ; MACRO printAt posx,posy,ptext
  ;   defw text.print_at_me
  ;   defb posx, posy
  ;   defw ptext
  ; ENDM

; печать текста сверху экрана
  MACRO printScreen color, text
      dw text.print_screen_me
      db color
      dw text
  ENDM

include "../core/routines/text68.asm"

print_screen_me:
    PUSH HL
    CALL input.noKey
    LD D, 0
    LD E, 24
    CALL screenfx.clear_window; очищаем экран
    POP HL
    mLDA; загрузили цвет
    PUSH HL
    CALL screen.set_colors
    POP HL
    mLDE
    PUSH HL
    LD HL, SCREEN_ADDR
    EX HL, DE
    CALL Text68.print_68at
    POP HL
    JP zxengine.process

; print_at_me:
;   mLDE
;   mLBC
;   PUSH HL ; запомнили указатель скрипта
;   PUSH BC
;   POP HL
;   CALL print_at
;   POP HL
;   JP zxengine.process

  ; На входе 
  ; в DE координаты XY
  ; в HL - указатель на текст
print_at:
  CALL math.pos_scr; рассчитали адрес на экране по координатам
  CALL Text68.print_68at
  RET

ENDMODULE
