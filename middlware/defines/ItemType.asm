STRUCT ItemType
spr_num db 00; номер спрайта предмета, должен идти первым 
; чтобы после вызова функции calcItemType 
; можно было получать номер спрайта как LD A, (HL)
; а не через PUSH HL/POP IX/LD A,(IX+ItemType.spr_num)
;--- прочие части
; name_ptr dw 00; не нужно, у нас показывается по name_ptr в спрайте
round db 00; скажем, заряд
weight db 00; скажем, вес
    db 00
; script_ptr dw 00; указатель на скрипт обработки действий
ENDS
