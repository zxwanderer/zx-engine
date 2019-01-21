PersonagesNum equ 1

CHARS_SET: ; описываем героев:
; Hero1: Entities.Hero 31,31, 9, 0, 0, tHeroName1, 00
Hero2: Hero 3,10, 0, 160, 160, 0, 0, tHeroName2, 00

ITEM_ARRAY:
  Item Chair.item, 4,6, Floor.spr, #ff, 00
  Item Chair.item, 4,12, Floor.spr, #ff, 00
  Item Chair.item, 4,18, Floor.spr, #ff, 00
  
  Item Chair.item, 11,6, Floor.spr, #ff, 00
  Item Chair.item, 11,12, Floor.spr, #ff, 00
  
  Item Chair.item, 6,6, Floor.spr, #ff, 00
  Item Chair.item, 6,9, Floor.spr, #ff, 00
  Item Chair.item, 6,13, Floor.spr, #ff, 00
  Item Chair.item, 6,16, Floor.spr, #ff, 00

  Item Chair.item, 8,6, Floor.spr, #ff, 00
  Item Chair.item, 8,9, Floor.spr, #ff, 00
  Item Chair.item, 8,13, Floor.spr, #ff, 00
  Item Chair.item, 8,16, Floor.spr, #ff, 00

  Item CanisterEmpty.item, 10,16, Floor.spr, #ff, 00
  Item CanisterEmpty.item, 10,17, Floor.spr, #ff, 00
  Item CanisterEmpty.item, 11,16, Floor.spr, #ff, 00

  Item Canister.item, 9,20, FloorCyan.spr, #ff, 00

  Item Wrench.item, 11,17, FloorCyan.spr, #ff, 00

  Item Nippers.item, 11,11, Floor.spr, #ff, 00

  DUP Item*50
    defb #ff; item.itemID = #ff - признак того что предмета нет 
   EDUP

ItemArraySize equ 50; максимальное число предметов 
