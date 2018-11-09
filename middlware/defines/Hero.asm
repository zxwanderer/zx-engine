STRUCT Hero
pos Point 0,0 ; позиция на карте
dir db 00; направление
sprite db 00; текущий спрайт
base_spr db 00; базовый спрайт ( текущий спрайт = базовый спрайт + dir)
ground db 00; на чем стоит
flags db 00; признаки-флаги
name_p dw #0000
; указатели на предметы в правой и левой руке, hand_right_p_1 00 - в руке пусто
hand_right_p db 00
hand_right_p_1 db 00
; hand_left_p dw 00
; --- одежда
; head dw 00
; mask dw 00
; torse dw 00
; boot dw 00
ENDS