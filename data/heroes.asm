PersonagesNum equ 1

CHARS_SET: ; описываем героев:
; Hero1: Entities.Hero 31,31, 9, 0, 0, tHeroName1, 00
Hero2: Hero 4,21, Hero09.spr, 0, 0, tHeroName2, 00

ITEM_ARRAY:
; Chair_1: Item Chair.item, 5,7, Floor.spr, #ff, 00
; Chair_2: Item Chair.item, 5,11, Floor.spr, #ff, 00
; Chair_3: Item Chair.item, 5,15, Floor.spr, #ff, 00
; Chair_4: Item Chair.item, 5,19, Floor.spr, #ff, 00
; Shard_1: items.Item Shard_Item, 5,23, Floor, #ff, 00
Chair_5: Item Chair.item, 5,23, Floor.spr, #ff, 00

  DUP Item*100
    defb #ff; item.itemID = #ff - признак того что предмета нет 
   EDUP

ItemArraySize equ 100; максимальное число предметов 
