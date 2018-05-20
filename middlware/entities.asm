    MODULE Entities

; тип ячейки на карте или предмета
STRUCT CellType
name_ptr dw 00; указатель на имя типа
script_ptr dw 00; указатель на скрипт обработки действий если нужен, иначе 0000
;--- разные части
;prot db 00; проницаемость для предметов, 00 - полностью проницаем
;force_destr db 00; сила для уничтожения
ENDS

STRUCT Hero
pos Point 0,0 ; позиция на карте
sprite db 00; спрайт
ground db 00; на чем стоит
flags db 00; признаки-флаги
name_p dw #0000
; --- инвентарь
; head db 00
; mask db 00
; left_hand db 00
; righ_hand db 00
; torse db 00
; boot db 00
ENDS


    ENDMODULE
