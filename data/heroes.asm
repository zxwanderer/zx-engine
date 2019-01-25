PersonagesNum equ 1

CHARS_SET: ; описываем героев:
; Hero1: Entities.Hero 31,31, 9, 0, 0, tHeroName1, 00
; Hero2: Hero 3,10, 0, 160, 160, 0, 0, tHeroName2, 00

Hero2: Hero 3, 21, 0, 160, 160, 0, 0, tHeroName2, 00


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

  Item Chair.item, 5,21, Floor.spr, #ff, 00
  Item Chair.item, 5,22, Floor.spr, #ff, 00
  Item Chair.item, 5,23, Floor.spr, #ff, 00
  Item Chair.item, 3,22, Floor.spr, #ff, 00

  Item Chair.item, 21,30, Floor.spr, #ff, 00

; склад
  Item Canister.item, 10,16, FloorRed.spr, #ff, 00
  Item CanisterEmpty.item, 10,17, FloorRed.spr, #ff, 00
  Item CanisterEmpty.item, 11,16, FloorRed.spr, #ff, 00

; лаборатория
  Item CanisterEmpty.item, 25,6, FloorWhite.spr, #ff, 00
  Item CanisterEmpty.item, 28,6, FloorWhite.spr, #ff, 00

; генераторная
  Item CanisterEmpty.item, 25,19, Nipple.spr, #ff, 00
  Item CanisterEmpty.item, 25,17, Nipple.spr, #ff, 00
  Item CanisterEmpty.item, 26,17, Nipple.spr, #ff, 00
  Item CanisterEmpty.item, 27,17, Nipple.spr, #ff, 00

; заросли
  Item CanisterEmpty.item, 18,9, Grass.spr, #ff, 00

  Item Wrench.item, 11,17, FloorRed.spr, #ff, 00

  Item Nippers.item, 11,11, Floor.spr, #ff, 00
  Item Nippers.item, 17,10, Grass.spr, #ff, 00

  Item RedCard.item, 27,3, FloorWhite.spr, #ff, 00

  DUP Item*50
    defb #ff; item.itemID = #ff - признак того что предмета нет 
   EDUP

ItemArraySize equ 50; максимальное число предметов 
