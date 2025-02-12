include "Point_h.asm"

  ifndef __ITEM_H_
  define __ITEM_H_

  STRUCT Item
itemID db 00; номер типа предмета
pos Point 0,0 ; позиция на карте
ground db 00; что оказалось на земле когда бросили предмет
owner db 00; номер героя в инвентаре которого находится предмет, если #ff то лежит на карте
;--- типа заряд :)
rounds db 00;
; parent_ptr dw 0; у кого лежит, если 0000 то лежит на карте, иначе указатель на hero
  ENDS

  endif
