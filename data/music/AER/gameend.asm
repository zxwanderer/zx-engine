                ; ORG 40000
MUSICDATA:

; *** Song layout ***
                      DEFW      PAT0
                      DEFW      PAT7
LOOPSTART:            DEFW      PAT1
                      DEFW      PAT2
                      DEFW      PAT1
                      DEFW      PAT3
                      DEFW      PAT4
                      DEFW      PAT5
                      DEFW      PAT4
                      DEFW      PAT6
                      DEFW      $0000
                      DEFW      LOOPSTART

; *** Patterns ***
PAT0:
                DEFW  3692     ; Pattern tempo
                ;    Drum,Chan.1 ,Chan.2 ,Chan.3
                DEFB  $08,$81,$D8,$00    ,$80,$EC
                DEFB      $00    ,$81,$D8,$01
                DEFB      $83,$B0,$00    ,$01
                DEFB      $00    ,$83,$B0,$01
                DEFB  $03,$81,$D8,$00    ,$01
                DEFB      $00    ,$81,$D8,$01
                DEFB      $83,$B0,$00    ,$81,$3B
                DEFB      $00    ,$83,$B0,$01
                DEFB  $08,$81,$D8,$00    ,$80,$76
                DEFB      $00    ,$81,$D8,$01
                DEFB      $83,$B0,$00    ,$80,$EC
                DEFB      $82,$C3,$83,$B0,$01
                DEFB  $03,$82,$31,$82,$C3,$80,$8C
                DEFB  $08,$00    ,$82,$31,$01
                DEFB  $08,$82,$31,$00    ,$81,$18
                DEFB      $82,$C3,$82,$C3,$01
                DEFB  $FF  ; End of Pattern

PAT1:
                DEFW  3692     ; Pattern tempo
                ;    Drum,Chan.1 ,Chan.2 ,Chan.3
                DEFB  $08,$81,$D8,$F5,$86,$80,$EC
                DEFB      $00    ,$01    ,$01
                DEFB      $83,$B0,$01    ,$01
                DEFB      $00    ,$F4,$E7,$01
                DEFB  $03,$81,$D8,$01    ,$01
                DEFB      $00    ,$F2,$76,$01
                DEFB      $83,$B0,$F4,$63,$81,$3B
                DEFB      $00    ,$01    ,$01
                DEFB  $08,$81,$D8,$F2,$76,$80,$76
                DEFB      $00    ,$01    ,$01
                DEFB      $83,$B0,$01    ,$80,$EC
                DEFB      $82,$C3,$01    ,$01
                DEFB  $03,$82,$31,$F3,$B0,$80,$8C
                DEFB  $08,$00    ,$01    ,$01
                DEFB  $08,$82,$31,$01    ,$81,$18
                DEFB      $82,$C3,$01    ,$01
                DEFB  $FF  ; End of Pattern

PAT2:
                DEFW  3692     ; Pattern tempo
                ;    Drum,Chan.1 ,Chan.2 ,Chan.3
                DEFB  $08,$81,$D8,$C5,$86,$80,$EC
                DEFB      $00    ,$01    ,$01
                DEFB      $83,$B0,$01    ,$01
                DEFB      $00    ,$C4,$E7,$01
                DEFB  $03,$81,$D8,$01    ,$01
                DEFB      $00    ,$C2,$76,$01
                DEFB      $83,$B0,$C4,$63,$81,$3B
                DEFB      $00    ,$01    ,$01
                DEFB  $08,$81,$76,$C2,$ED,$80,$BB
                DEFB      $00    ,$01    ,$01
                DEFB      $82,$ED,$01    ,$81,$76
                DEFB      $81,$76,$01    ,$01
                DEFB  $03,$82,$ED,$01    ,$80,$BB
                DEFB  $08,$00    ,$01    ,$01
                DEFB  $08,$81,$D8,$01    ,$81,$76
                DEFB      $83,$B0,$01    ,$01
                DEFB  $FF  ; End of Pattern

PAT3:
                DEFW  3692     ; Pattern tempo
                ;    Drum,Chan.1 ,Chan.2 ,Chan.3
                DEFB  $08,$81,$D8,$C5,$86,$80,$EC
                DEFB      $00    ,$01    ,$01
                DEFB      $83,$B0,$01    ,$01
                DEFB      $00    ,$C4,$E7,$01
                DEFB  $03,$81,$D8,$01    ,$01
                DEFB      $00    ,$C2,$76,$01
                DEFB      $83,$B0,$C4,$63,$81,$3B
                DEFB      $00    ,$01    ,$01
                DEFB  $08,$81,$76,$C2,$ED,$80,$BB
                DEFB      $00    ,$01    ,$01
                DEFB  $03,$82,$ED,$01    ,$81,$76
                DEFB      $81,$76,$01    ,$01
                DEFB  $03,$82,$ED,$01    ,$80,$BB
                DEFB  $03,$00    ,$01    ,$01
                DEFB  $03,$81,$D8,$01    ,$81,$76
                DEFB  $03,$83,$B0,$01    ,$01
                DEFB  $FF  ; End of Pattern

PAT4:
                DEFW  3692     ; Pattern tempo
                ;    Drum,Chan.1 ,Chan.2 ,Chan.3
                DEFB  $08,$82,$11,$F6,$34,$81,$08
                DEFB      $00    ,$01    ,$01
                DEFB      $84,$23,$01    ,$01
                DEFB      $00    ,$F5,$86,$01
                DEFB  $03,$82,$11,$01    ,$01
                DEFB      $00    ,$F2,$C3,$01
                DEFB      $84,$23,$F4,$E7,$81,$61
                DEFB      $00    ,$01    ,$01
                DEFB  $08,$82,$11,$F2,$C3,$80,$84
                DEFB      $00    ,$01    ,$01
                DEFB      $84,$23,$01    ,$81,$08
                DEFB      $83,$1A,$01    ,$01
                DEFB  $03,$82,$76,$F4,$23,$80,$9D
                DEFB  $08,$00    ,$01    ,$01
                DEFB  $08,$82,$76,$01    ,$81,$3B
                DEFB      $83,$1A,$01    ,$01
                DEFB  $FF  ; End of Pattern

PAT5:
                DEFW  3692     ; Pattern tempo
                ;    Drum,Chan.1 ,Chan.2 ,Chan.3
                DEFB  $08,$82,$11,$C6,$34,$81,$08
                DEFB      $00    ,$01    ,$01
                DEFB      $84,$23,$01    ,$01
                DEFB      $00    ,$C5,$86,$01
                DEFB  $03,$82,$11,$01    ,$01
                DEFB      $00    ,$C2,$C3,$01
                DEFB      $84,$23,$C4,$E7,$81,$61
                DEFB      $00    ,$01    ,$01
                DEFB  $08,$81,$A4,$C3,$49,$80,$D2
                DEFB      $00    ,$01    ,$01
                DEFB      $83,$49,$01    ,$81,$A4
                DEFB      $81,$A4,$01    ,$01
                DEFB  $03,$83,$49,$01    ,$80,$D2
                DEFB  $08,$00    ,$01    ,$01
                DEFB  $08,$82,$11,$01    ,$81,$A4
                DEFB      $84,$23,$01    ,$01
                DEFB  $FF  ; End of Pattern

PAT6:
                DEFW  3692     ; Pattern tempo
                ;    Drum,Chan.1 ,Chan.2 ,Chan.3
                DEFB  $08,$82,$11,$C6,$34,$81,$08
                DEFB      $00    ,$01    ,$01
                DEFB      $84,$23,$01    ,$01
                DEFB      $00    ,$C5,$86,$01
                DEFB  $03,$82,$11,$01    ,$01
                DEFB      $00    ,$C2,$C3,$01
                DEFB      $84,$23,$C4,$E7,$81,$61
                DEFB      $00    ,$01    ,$01
                DEFB  $08,$81,$A4,$C3,$49,$80,$D2
                DEFB      $00    ,$01    ,$01
                DEFB  $03,$83,$49,$01    ,$81,$A4
                DEFB      $81,$A4,$01    ,$01
                DEFB  $03,$00    ,$C1,$A4,$80,$D2
                DEFB  $03,$80,$9D,$00    ,$00
                DEFB  $03,$01    ,$00    ,$01
                DEFB  $03,$01    ,$01    ,$01
                DEFB  $FF  ; End of Pattern

PAT7:
                DEFW  3692     ; Pattern tempo
                ;    Drum,Chan.1 ,Chan.2 ,Chan.3
                DEFB  $08,$81,$D8,$00    ,$80,$EC
                DEFB      $00    ,$81,$D8,$01
                DEFB      $83,$B0,$00    ,$01
                DEFB      $00    ,$83,$B0,$01
                DEFB  $03,$81,$D8,$00    ,$01
                DEFB      $00    ,$81,$D8,$01
                DEFB      $83,$B0,$00    ,$81,$3B
                DEFB      $00    ,$83,$B0,$01
                DEFB  $08,$81,$D8,$00    ,$80,$76
                DEFB      $00    ,$81,$D8,$01
                DEFB  $08,$83,$B0,$00    ,$80,$EC
                DEFB      $82,$C3,$83,$B0,$01
                DEFB  $08,$82,$31,$82,$C3,$80,$8C
                DEFB      $00    ,$00    ,$00
                DEFB  $08,$82,$31,$00    ,$81,$18
                DEFB      $00    ,$00    ,$00
                DEFB  $FF  ; End of Pattern

