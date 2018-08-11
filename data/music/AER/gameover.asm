                ; ORG 40000
MUSICDATA:

; *** Song layout ***
LOOPSTART:            DEFW      PAT0
                      DEFW      PAT1
                      DEFW      $0000
                      DEFW      LOOPSTART

; *** Patterns ***
PAT0:
                DEFW  3692     ; Pattern tempo
                ;    Drum,Chan.1 ,Chan.2 ,Chan.3
                DEFB  $08,$83,$B0,$C1,$3B,$F1,$D8
                DEFB  $08,$01    ,$C1,$76,$01
                DEFB  $08,$00    ,$C2,$ED,$00
                DEFB  $08,$01    ,$C1,$76,$F2,$76
                DEFB  $08,$83,$B0,$C2,$C3,$01
                DEFB      $01    ,$C1,$61,$F3,$B0
                DEFB      $00    ,$C2,$76,$F1,$F4
                DEFB      $01    ,$C0,$FA,$00
                DEFB  $08,$83,$B0,$C1,$F4,$F2,$76
                DEFB      $00    ,$00    ,$F3,$B0
                DEFB      $01    ,$C1,$D8,$F2,$31
                DEFB      $00    ,$C3,$B0,$F2,$76
                DEFB      $83,$B0,$C1,$D8,$F1,$F4
                DEFB      $00    ,$C1,$18,$00
                DEFB      $01    ,$C0,$FA,$F2,$76
                DEFB      $01    ,$C0,$EC,$00
                DEFB  $FF  ; End of Pattern

PAT1:
                DEFW  3692     ; Pattern tempo
                ;    Drum,Chan.1 ,Chan.2 ,Chan.3
                DEFB      $E0,$DE,$F1,$BD,$F3,$7B
                DEFB      $01    ,$01    ,$01
                DEFB      $01    ,$01    ,$01
                DEFB      $01    ,$01    ,$01
                DEFB      $01    ,$01    ,$01
                DEFB      $01    ,$01    ,$01
                DEFB      $01    ,$01    ,$01
                DEFB  $08,$01    ,$01    ,$01
                DEFB  $08,$01    ,$01    ,$01
                DEFB  $08,$01    ,$01    ,$01
                DEFB  $08,$01    ,$01    ,$01
                DEFB  $08,$01    ,$01    ,$01
                DEFB  $08,$01    ,$01    ,$01
                DEFB      $01    ,$01    ,$00
                DEFB  $08,$01    ,$00    ,$01
                DEFB      $01    ,$01    ,$01
                DEFB  $FF  ; End of Pattern

