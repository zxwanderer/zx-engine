  ifndef __ITEM_TYPE_H_
  define __ITEM_TYPE_H_

    STRUCT ItemType
spr_num db 00; номер спрайта предмета, должен идти первым 
; чтобы после вызова функции calcItemType 
; можно было получать номер спрайта как LD A, (HL)
; а не через PUSH HL/POP IX/LD A,(IX+ItemType.spr_num)
;--- прочие части
round db 00; скажем, заряд
weight db 00; скажем, вес
    db 00
    ENDS

  endif
