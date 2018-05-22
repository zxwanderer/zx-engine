MODULE beeper

  MACRO setBorder color
    defw beeper.set_border
    defb color
  ENDM

  MACRO laserFX
    defw beeper.laser_me
    ; defb num
  ENDM

  MACRO shiruFX num
    defw beeper.shiru_me
    defb num
  ENDM

  MACRO vibrFX
    defw beeper.vibr_me
    ; defb num
  ENDM

  MACRO explosFX
    defw beeper.explos_me
    ; defb num
  ENDM

set_border:
  LD A,(HL)
  INC HL
  OUT (#FE), A
  JP zxengine.process

vibr_me:
  PUSH HL
  CALL vibr
  POP hl
  JP zxengine.process

laser_me:
  PUSH HL
  CALL laser
  POP HL
  JP zxengine.process

explos_me:
  PUSH HL
  CALL explos
  POP HL
  JP zxengine.process

shiru_me:
  mLDA
  PUSH HL
  CALL FX_SET
  POP HL
  JP zxengine.process  

vibr:  LD    H,100
       LD    E,10
       LD    B,4
       LD    L,1

        ;LD    A,(23624)
        ;AND   #38
        ;RRA
        ;RRA
        ;RRA
        ;LD    C,A
VIBR1  LD    D,E         ;продолжительность цикла спада (подъема)
VIBR2  LD    A,C
        XOR   16
        LD    C,A
				AND 11111000b
        OUT   (254),A
        LD    A,H         ;изменение частоты звука
        ADD   A,L
        LD    H,A
VIBR3  DEC   A           ;цикл задержки
        JR    NZ,VIBR3
        DEC   D
        JR    NZ,VIBR2
        LD    A,L         ;смена направления изменения частоты
        NEG
        LD    L,A
        DJNZ  VIBR1
        RET
  
laser:
  LD   B,1
       LD    C,200
       LD    H,50
       ;LD    A,(23624)
       ;AND   #38
       ;RRA
       ;RRA
       ;RRA
      ;  DI
LASER1 PUSH  BC
       LD    L,H
LASER2
			 XOR   16
			 AND 11111000b
       OUT   (254),A
       LD    B,H
       DJNZ  $
       INC   H           ;другой вариант - DEC H
       DEC   C
       JR    NZ,LASER2
       LD    H,L
       POP   BC
       DJNZ  LASER1
      ;  EI
       RET

explos
  ; B - количество повторений эффекта
  ; D - задается длительность звучания
  ; E начальную среднюю частоту.
      LD    B,1
      LD    D,50
      LD    E,-1

			/* LD    B,1
      LD    D,10
      LD    E,200 */

      ;LD    B,2
      ;LD    D,35
      ;LD    E,100

 ;LD    A,(23624)
        ;AND   #38
        ;RRA
        ;RRA
        ;RRA
        ;LD    L,A
        ; DI
EXPL1  PUSH  BC
      	PUSH  DE
EXPL2  PUSH  DE
EXPL3  LD    B,E
        DJNZ  $           ;задержка
        LD    A,(BC)      ;в паре BC один из первых 256 адресов ПЗУ
        ;AND   16
        ;OR    L
        OUT   (254),A
        INC   C
        DEC   D
        JR    NZ,EXPL3
        POP   DE
       ; Изменение высоты шума (понижение среднего тона;
       ;  если заменить на DEC E, тон будет наоборот повышаться)
       INC   E
       DEC   D
       JR    NZ,EXPL2
       POP   DE
       POP   BC
       DJNZ  EXPL1       ;повторение всего эффекта
      ;  EI
       RET

ENDMODULE
