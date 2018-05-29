  MODULE Text68

  /* MACRO Text68.print68at posx,posy,text
    LD HL,text
    LD DE,posx*256+posy
    CALL Text68.print_68at
  ENDM */

; НЕ УЧИТЫВАЕТ DOWN_HL !!!!!!
; ВСЕ В ПРЕДЕЛАХ ОДНОЙ ТРЕТИ ЭКРАНА!!!! :E
; DE - screen pointer
; HL - text pointer
print_68at:
  ;CALL math.pos_scr
  ;PUSH DE
  ;LD A,1
  ;CALL ScreenBuf.clean_rows
  ;POP DE
  LD C, 7
LOOP:
;-----
  LD A,(HL)
  OR A
  JR Z, EXIT
  PUSH HL
  CALL PRINT_68

; ----- CALC_CE ----
  LD A,C
  SUB 6
  JR NC, $+5;calc_ce_end
  INC E
  AND 7
calc_ce_end: 
  LD C,A


  LD A, E
  AND 31
  CP 31
  JR NZ, no_next_pos
  LD A, E
  AND 11100000b
  LD E, A
  call math.down_pos
  LD C,7
no_next_pos:


;------
  POP HL
  INC HL
  JR LOOP
EXIT:

  ;LD DE, #4000
  ;LD HL, TEXT

  RET

PRINT_68:
  PUSH DE
  LD L,A
  LD B,C
  LD A,#80 ; ( 10000000 )
  RRCA
  DJNZ $-1
  LD (PRN+1),A
  LD H, HIGH p68_font
  LD B,8
PRGO:
  PUSH HL
  LD L,(HL)
PRN:
  LD H,1
PR1:
  ADD HL,HL
  ADD HL,HL
  JR NC,PR1
  LD A,(DE)
  OR H
  LD (DE),A
  INC E
  LD A,L
  LD (DE),A
  DEC E
  INC D
  POP HL
  INC H
  DJNZ PRGO
  POP DE
  RET

  ENDMODULE
