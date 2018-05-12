MODULE sprite16

; отрисовываем спрайт на экране
; вход DE - экранный адрес
; HL - указатель на данные спрайта
show_sprite:

  PUSH DE

  // thanks to Alone Coder!
  LD BC,#0808
spr_loop_1:
  LDI // LD (DE),(HL)  DE+1, HL+1, BC-1
  LD A,(HL)
  LD (DE),A
  DEC E
  INC D
  INC HL
  DJNZ spr_loop_1

  POP DE
  PUSH DE

  LD BC, 32
  EX HL, DE
  ADD HL, BC
  EX HL, DE; DE = DE + 32

  LD BC,#0808
_my_spr_loop_2:
  LDI // LD (DE),(HL)  DE+1, HL+1
  LD A,(HL)
  LD (DE),A
  DEC E
  INC D
  INC HL
  DJNZ _my_spr_loop_2

  POP DE
  PUSH HL
  call math.addr_to_attr
  LDI
  LDI
  POP HL
  LD A,E
  ADD A,30; нижний ряд ( 30 а не 32 так как 2 уже прибавили выше )
  LD E,A
  LDI
  LDI

  RET

ENDMODULE
