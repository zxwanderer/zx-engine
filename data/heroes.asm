PersonagesNum equ 1

CHARS_SET: ; описываем героев:
; Hero1: Entities.Hero 31,31, 9, 0, 0, tHeroName1, 00
Hero2: Hero 3,14, 0, 160, 160, 0, 0, tHeroName2, 00

ITEM_ARRAY:
; Chair_1: Item Chair.item, 5,7, Floor.spr, #ff, 00
; Chair_2: Item Chair.item, 5,11, Floor.spr, #ff, 00
; Chair_3: Item Chair.item, 5,15, Floor.spr, #ff, 00
Chair_1: Item Chair.item, 3,21, Floor.spr, #ff, 00
Chair_2: Item Chair.item, 3,19, Floor.spr, #ff, 00
Chair_3: Item Chair.item, 3,15, Floor.spr, #ff, 00

  DUP Item*100
    defb #ff; item.itemID = #ff - признак того что предмета нет 
   EDUP

ItemArraySize equ 100; максимальное число предметов 
