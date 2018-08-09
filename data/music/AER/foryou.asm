; ************************************************************************
; * Song data...
; ************************************************************************

; *** DATA ***
MUSICDATA:

; *** Song layout ***
LOOPSTART:            DEFW      PAT0
                      DEFW      PAT1
                      DEFW      PAT0
                      DEFW      PAT1
                      DEFW      PAT2
                      DEFW      PAT3
                      DEFW      PAT2
                      DEFW      PAT4
                      DEFW      PAT5
                      DEFW      PAT6
                      DEFW      PAT5
                      DEFW      PAT6
                      DEFW      PAT7
                      DEFW      PAT7
                      DEFW      PAT7
                      DEFW      PAT7
                      DEFW      PAT8
                      DEFW      PAT9
                      DEFW      PAT8
                      DEFW      PAT9
                      DEFW      PAT10
                      DEFW      PAT11
                      DEFW      PAT10
                      DEFW      PAT12
                      DEFW      PAT13
                      DEFW      PAT13
                      DEFW      PAT13
                      DEFW      PAT13
                      DEFW      PAT14
                      DEFW      PAT14
                      DEFW      PAT14
                      DEFW      PAT14
                      DEFW      PAT13
                      DEFW      PAT13
                      DEFW      PAT13
                      DEFW      PAT13
                      DEFW      PAT15
                      DEFW      $0000
                      DEFW      LOOPSTART

; *** Patterns ***
PAT0:
                DEFW  3692     ; Pattern tempo
                ;    Drum,Chan.1 ,Chan.2 ,Chan.3
                DEFB      $00    ,$00    ,$F1,$D8
                DEFB      $01    ,$01    ,$F1,$D8
                DEFB      $01    ,$01    ,$F3,$B0
                DEFB      $01    ,$01    ,$F1,$D8
                DEFB      $01    ,$01    ,$01
                DEFB      $01    ,$01    ,$00
                DEFB      $01    ,$01    ,$01
                DEFB      $01    ,$01    ,$01
                DEFB      $01    ,$01    ,$F1,$D8
                DEFB      $01    ,$01    ,$F1,$D8
                DEFB      $01    ,$01    ,$F3,$B0
                DEFB      $01    ,$01    ,$F1,$D8
                DEFB      $01    ,$01    ,$01
                DEFB      $01    ,$01    ,$00
                DEFB      $01    ,$01    ,$01
                DEFB      $01    ,$01    ,$01
                DEFB  $FF  ; End of Pattern

PAT1:
                DEFW  3692     ; Pattern tempo
                ;    Drum,Chan.1 ,Chan.2 ,Chan.3
                DEFB      $00    ,$00    ,$F1,$D8
                DEFB      $01    ,$01    ,$F1,$D8
                DEFB      $01    ,$01    ,$F3,$B0
                DEFB      $01    ,$01    ,$F1,$D8
                DEFB      $01    ,$01    ,$01
                DEFB      $01    ,$01    ,$00
                DEFB      $01    ,$01    ,$01
                DEFB      $01    ,$01    ,$01
                DEFB      $01    ,$01    ,$F1,$D8
                DEFB      $01    ,$01    ,$F1,$D8
                DEFB      $01    ,$01    ,$F3,$B0
                DEFB      $01    ,$01    ,$F1,$D8
                DEFB      $01    ,$01    ,$F1,$A4
                DEFB      $01    ,$01    ,$F3,$49
                DEFB      $01    ,$01    ,$F1,$76
                DEFB      $01    ,$01    ,$F2,$ED
                DEFB  $FF  ; End of Pattern

PAT2:
                DEFW  3692     ; Pattern tempo
                ;    Drum,Chan.1 ,Chan.2 ,Chan.3
                DEFB  $06,$00    ,$C1,$D8,$F1,$D8
                DEFB      $01    ,$00    ,$F1,$D8
                DEFB      $01    ,$C2,$C3,$F3,$B0
                DEFB      $01    ,$00    ,$F1,$D8
                DEFB  $06,$01    ,$C2,$ED,$01
                DEFB      $01    ,$00    ,$00
                DEFB      $01    ,$C2,$C3,$01
                DEFB      $01    ,$00    ,$01
                DEFB  $06,$01    ,$C1,$D8,$F1,$D8
                DEFB      $01    ,$00    ,$F1,$D8
                DEFB      $01    ,$C2,$C3,$F3,$B0
                DEFB      $01    ,$00    ,$F1,$D8
                DEFB  $06,$01    ,$C2,$ED,$01
                DEFB      $01    ,$00    ,$00
                DEFB      $01    ,$C2,$C3,$01
                DEFB      $01    ,$00    ,$01
                DEFB  $FF  ; End of Pattern

PAT3:
                DEFW  3692     ; Pattern tempo
                ;    Drum,Chan.1 ,Chan.2 ,Chan.3
                DEFB  $06,$00    ,$C1,$D8,$F1,$D8
                DEFB      $01    ,$00    ,$F1,$D8
                DEFB      $01    ,$C2,$C3,$F3,$B0
                DEFB      $01    ,$00    ,$F1,$D8
                DEFB  $06,$01    ,$C2,$ED,$01
                DEFB      $01    ,$00    ,$00
                DEFB      $01    ,$C2,$C3,$01
                DEFB      $01    ,$00    ,$01
                DEFB  $06,$01    ,$C1,$D8,$F1,$D8
                DEFB      $01    ,$00    ,$F1,$D8
                DEFB      $01    ,$C2,$C3,$F3,$B0
                DEFB      $01    ,$00    ,$F1,$D8
                DEFB  $06,$01    ,$C2,$ED,$F1,$A4
                DEFB      $01    ,$00    ,$F3,$49
                DEFB      $01    ,$C2,$C3,$F1,$76
                DEFB      $01    ,$00    ,$F2,$ED
                DEFB  $FF  ; End of Pattern

PAT4:
                DEFW  3692     ; Pattern tempo
                ;    Drum,Chan.1 ,Chan.2 ,Chan.3
                DEFB  $06,$00    ,$C1,$D8,$F1,$D8
                DEFB      $01    ,$00    ,$F1,$D8
                DEFB      $01    ,$C2,$C3,$F3,$B0
                DEFB      $01    ,$00    ,$F1,$D8
                DEFB  $06,$01    ,$C2,$ED,$01
                DEFB      $01    ,$00    ,$00
                DEFB      $01    ,$C2,$C3,$01
                DEFB      $01    ,$00    ,$01
                DEFB  $06,$01    ,$C1,$D8,$F1,$D8
                DEFB      $01    ,$00    ,$F1,$D8
                DEFB      $01    ,$C2,$C3,$F3,$B0
                DEFB      $01    ,$00    ,$F1,$D8
                DEFB  $06,$F0,$76,$C2,$ED,$F1,$A4
                DEFB      $F0,$9D,$01    ,$00
                DEFB      $F0,$BB,$01    ,$01
                DEFB      $F0,$D2,$01    ,$F2,$ED
                DEFB  $FF  ; End of Pattern

PAT5:
                DEFW  3692     ; Pattern tempo
                ;    Drum,Chan.1 ,Chan.2 ,Chan.3
                DEFB  $06,$B0,$76,$C1,$D8,$F1,$D8
                DEFB      $00    ,$F3,$B0,$F1,$D8
                DEFB      $B0,$76,$C2,$C3,$F3,$B0
                DEFB      $00    ,$F7,$60,$F1,$D8
                DEFB  $03,$B0,$76,$C2,$ED,$01
                DEFB      $00    ,$F3,$B0,$00
                DEFB      $B0,$EC,$C2,$C3,$01
                DEFB      $B0,$FA,$F6,$92,$01
                DEFB  $06,$B0,$76,$C1,$D8,$F1,$D8
                DEFB      $00    ,$F7,$60,$F1,$D8
                DEFB      $B0,$76,$C2,$C3,$F3,$B0
                DEFB      $00    ,$F3,$B0,$F1,$D8
                DEFB  $03,$B0,$76,$C2,$ED,$01
                DEFB      $B0,$9D,$F7,$60,$00
                DEFB      $B0,$EC,$C2,$C3,$01
                DEFB      $B0,$9D,$F3,$B0,$01
                DEFB  $FF  ; End of Pattern

PAT6:
                DEFW  3692     ; Pattern tempo
                ;    Drum,Chan.1 ,Chan.2 ,Chan.3
                DEFB  $06,$B0,$76,$C1,$D8,$F1,$D8
                DEFB      $00    ,$F3,$B0,$F1,$D8
                DEFB      $B0,$76,$C2,$C3,$F3,$B0
                DEFB      $00    ,$F7,$60,$F1,$D8
                DEFB  $03,$B0,$76,$C2,$ED,$01
                DEFB      $00    ,$F3,$B0,$00
                DEFB      $B0,$EC,$C2,$C3,$01
                DEFB      $B0,$FA,$F6,$92,$01
                DEFB  $06,$B0,$76,$C1,$D8,$F1,$D8
                DEFB      $00    ,$F7,$60,$F1,$D8
                DEFB      $B0,$76,$C2,$C3,$F3,$B0
                DEFB      $00    ,$F3,$B0,$F1,$D8
                DEFB  $03,$B0,$76,$C2,$ED,$00
                DEFB      $B0,$9D,$F7,$60,$01
                DEFB  $03,$B0,$EC,$C2,$C3,$01
                DEFB  $03,$B0,$9D,$F3,$B0,$01
                DEFB  $FF  ; End of Pattern

PAT7:
                DEFW  3692     ; Pattern tempo
                ;    Drum,Chan.1 ,Chan.2 ,Chan.3
                DEFB  $06,$B0,$84,$C2,$76,$F2,$11
                DEFB      $00    ,$F2,$11,$F2,$11
                DEFB      $B0,$84,$C2,$C3,$F4,$23
                DEFB      $00    ,$F2,$11,$F2,$11
                DEFB  $03,$B0,$84,$C1,$61,$01
                DEFB      $00    ,$F2,$11,$F1,$08
                DEFB      $B1,$08,$C2,$C3,$00
                DEFB      $B1,$18,$F2,$11,$01
                DEFB  $06,$B0,$84,$C2,$76,$F2,$11
                DEFB      $00    ,$F2,$C3,$F2,$11
                DEFB      $B0,$84,$C2,$C3,$F4,$23
                DEFB      $00    ,$F2,$C3,$F2,$11
                DEFB  $03,$B0,$84,$C1,$61,$01
                DEFB      $B0,$B0,$F2,$C3,$00
                DEFB      $B1,$08,$C2,$C3,$F2,$31
                DEFB      $B0,$B0,$F2,$C3,$F1,$D8
                DEFB  $FF  ; End of Pattern

PAT8:
                DEFW  3692     ; Pattern tempo
                ;    Drum,Chan.1 ,Chan.2 ,Chan.3
                DEFB  $06,$B0,$76,$D3,$B0,$F1,$D8
                DEFB      $00    ,$D3,$B0,$F1,$D8
                DEFB      $B0,$76,$D3,$B0,$F3,$B0
                DEFB      $00    ,$D3,$B0,$F1,$D8
                DEFB  $03,$B0,$76,$01    ,$01
                DEFB      $00    ,$01    ,$00
                DEFB      $B0,$EC,$D1,$D8,$01
                DEFB      $B0,$FA,$D3,$B0,$01
                DEFB  $06,$B0,$76,$D4,$63,$F1,$D8
                DEFB      $00    ,$D1,$D8,$F1,$D8
                DEFB      $B0,$76,$D3,$B0,$F3,$B0
                DEFB      $00    ,$D4,$63,$F1,$D8
                DEFB  $03,$B0,$76,$D3,$B0,$01
                DEFB      $B0,$9D,$D1,$D8,$00
                DEFB      $B0,$EC,$01    ,$01
                DEFB      $B0,$9D,$01    ,$01
                DEFB  $FF  ; End of Pattern

PAT9:
                DEFW  3692     ; Pattern tempo
                ;    Drum,Chan.1 ,Chan.2 ,Chan.3
                DEFB  $06,$B0,$76,$C5,$DB,$F1,$D8
                DEFB      $00    ,$C5,$DB,$F1,$D8
                DEFB      $B0,$76,$C5,$86,$F3,$B0
                DEFB      $00    ,$C4,$E7,$F1,$D8
                DEFB  $03,$B0,$76,$C5,$DB,$01
                DEFB      $00    ,$C5,$DB,$00
                DEFB      $B0,$EC,$C5,$86,$01
                DEFB      $B0,$FA,$C4,$E7,$01
                DEFB  $06,$B0,$76,$C3,$E8,$F1,$D8
                DEFB      $00    ,$C3,$E8,$F1,$D8
                DEFB      $B0,$76,$C3,$B0,$F3,$B0
                DEFB      $00    ,$C3,$49,$F1,$D8
                DEFB  $03,$B0,$76,$C3,$E8,$00
                DEFB      $B0,$9D,$C3,$E8,$01
                DEFB  $03,$B0,$EC,$C3,$B0,$01
                DEFB  $03,$B0,$9D,$C3,$49,$01
                DEFB  $FF  ; End of Pattern

PAT10:
                DEFW  3692     ; Pattern tempo
                ;    Drum,Chan.1 ,Chan.2 ,Chan.3
                DEFB  $06,$B0,$76,$D4,$63,$F1,$D8
                DEFB      $00    ,$D3,$B0,$F1,$D8
                DEFB      $B0,$76,$D3,$B0,$F3,$B0
                DEFB      $00    ,$D3,$B0,$F1,$D8
                DEFB  $03,$B0,$76,$D1,$D8,$01
                DEFB      $00    ,$D3,$49,$00
                DEFB      $B0,$EC,$D3,$B0,$01
                DEFB      $B0,$FA,$D1,$D8,$01
                DEFB  $06,$B0,$76,$D3,$B0,$F1,$D8
                DEFB      $00    ,$D1,$D8,$F1,$D8
                DEFB      $B0,$76,$D3,$49,$F3,$B0
                DEFB      $00    ,$D3,$B0,$F1,$D8
                DEFB  $03,$B0,$76,$D1,$D8,$01
                DEFB      $B0,$9D,$D1,$F4,$00
                DEFB      $B0,$EC,$D3,$E8,$01
                DEFB      $B0,$9D,$D2,$31,$01
                DEFB  $FF  ; End of Pattern

PAT11:
                DEFW  3692     ; Pattern tempo
                ;    Drum,Chan.1 ,Chan.2 ,Chan.3
                DEFB  $06,$B0,$76,$D2,$76,$F1,$D8
                DEFB      $00    ,$D2,$76,$F1,$D8
                DEFB      $B0,$76,$D1,$F4,$F3,$B0
                DEFB      $00    ,$D2,$76,$F1,$D8
                DEFB  $03,$B0,$76,$D2,$31,$01
                DEFB      $00    ,$D2,$31,$00
                DEFB      $B0,$EC,$D1,$D8,$01
                DEFB      $B0,$FA,$D2,$31,$01
                DEFB  $06,$B0,$76,$D1,$F4,$F1,$D8
                DEFB      $00    ,$D1,$F4,$F1,$D8
                DEFB      $B0,$76,$D1,$A4,$F3,$B0
                DEFB      $00    ,$D1,$F4,$F1,$D8
                DEFB  $03,$B0,$76,$D1,$D8,$01
                DEFB      $B0,$9D,$D1,$D8,$00
                DEFB      $B0,$EC,$D1,$76,$01
                DEFB      $B0,$9D,$D1,$D8,$01
                DEFB  $FF  ; End of Pattern

PAT12:
                DEFW  3692     ; Pattern tempo
                ;    Drum,Chan.1 ,Chan.2 ,Chan.3
                DEFB  $06,$B0,$76,$D2,$76,$F1,$D8
                DEFB      $00    ,$D2,$76,$F1,$D8
                DEFB      $B0,$76,$D1,$F4,$F3,$B0
                DEFB      $00    ,$D2,$76,$F1,$D8
                DEFB  $03,$B0,$76,$D2,$31,$01
                DEFB      $00    ,$D2,$31,$00
                DEFB      $B0,$EC,$D1,$D8,$01
                DEFB      $B0,$FA,$D2,$31,$01
                DEFB  $06,$B0,$76,$D1,$F4,$F1,$D8
                DEFB      $00    ,$D1,$F4,$F1,$D8
                DEFB      $B0,$76,$D1,$A4,$F3,$B0
                DEFB      $00    ,$D1,$F4,$F1,$D8
                DEFB  $03,$B0,$76,$D1,$D8,$01
                DEFB      $00    ,$00    ,$00
                DEFB      $B0,$EC,$D1,$76,$01
                DEFB      $00    ,$00    ,$01
                DEFB  $FF  ; End of Pattern

PAT13:
                DEFW  3692     ; Pattern tempo
                ;    Drum,Chan.1 ,Chan.2 ,Chan.3
                DEFB  $06,$B0,$76,$C1,$D8,$F1,$D8
                DEFB      $00    ,$F0,$EC,$F1,$D8
                DEFB      $B0,$76,$C2,$76,$F3,$B0
                DEFB      $00    ,$F0,$EC,$F1,$D8
                DEFB  $03,$B0,$76,$C2,$C3,$F0,$EC
                DEFB      $00    ,$F1,$D8,$F1,$D8
                DEFB      $B0,$EC,$C2,$76,$F1,$3B
                DEFB      $B0,$FA,$F0,$EC,$01
                DEFB  $06,$B0,$76,$C2,$ED,$F1,$D8
                DEFB      $00    ,$F1,$A4,$F1,$D8
                DEFB      $B0,$76,$C2,$C3,$F3,$B0
                DEFB      $00    ,$F1,$D8,$F1,$D8
                DEFB  $03,$B0,$76,$C2,$76,$01
                DEFB      $B0,$9D,$F0,$EC,$F1,$D8
                DEFB      $B0,$EC,$C2,$C3,$01
                DEFB      $B0,$9D,$F1,$D8,$01
                DEFB  $FF  ; End of Pattern

PAT14:
                DEFW  3692     ; Pattern tempo
                ;    Drum,Chan.1 ,Chan.2 ,Chan.3
                DEFB  $06,$B0,$76,$C0,$EC,$F1,$D8
                DEFB      $00    ,$F2,$76,$F1,$D8
                DEFB      $B0,$76,$C0,$EC,$F3,$B0
                DEFB      $00    ,$F2,$76,$F1,$D8
                DEFB  $03,$B0,$76,$C1,$D8,$01
                DEFB      $00    ,$F1,$3B,$F1,$D8
                DEFB      $B0,$EC,$C0,$EC,$01
                DEFB      $B0,$FA,$F2,$76,$01
                DEFB  $06,$B0,$76,$C1,$A4,$F1,$D8
                DEFB      $00    ,$F1,$3B,$F1,$D8
                DEFB      $B0,$76,$C1,$D8,$F3,$B0
                DEFB      $00    ,$F2,$76,$F1,$D8
                DEFB  $03,$B0,$76,$C0,$EC,$01
                DEFB      $B0,$9D,$F2,$ED,$F1,$76
                DEFB      $B0,$EC,$C1,$D8,$F0,$EC
                DEFB      $B0,$9D,$F2,$76,$01
                DEFB  $FF  ; End of Pattern

PAT15:
                DEFW  3692     ; Pattern tempo
                ;    Drum,Chan.1 ,Chan.2 ,Chan.3
                DEFB  $06,$B0,$76,$C1,$D8,$F1,$D8
                DEFB      $01    ,$01    ,$01
                DEFB      $01    ,$01    ,$01
                DEFB      $01    ,$01    ,$01
                DEFB  $03,$01    ,$01    ,$01
                DEFB      $01    ,$01    ,$00
                DEFB      $01    ,$01    ,$01
                DEFB      $01    ,$00    ,$01
                DEFB      $01    ,$01    ,$01
                DEFB      $01    ,$01    ,$01
                DEFB      $00    ,$01    ,$01
                DEFB      $01    ,$01    ,$01
                DEFB      $01    ,$01    ,$01
                DEFB      $01    ,$01    ,$01
                DEFB      $01    ,$01    ,$01
                DEFB      $01    ,$01    ,$01
                DEFB  $FF  ; End of Pattern

