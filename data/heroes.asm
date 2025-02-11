PersonagesNum equ 1

CHARS_SET: ; описываем героев:
Hero2: Hero 3,10, 0, Hero09.spr, Hero09.spr, 0, 0, tHeroName2, 00
CHARS_SET_END

ItemArraySize equ 100; максимальное число предметов 

ITEM_ARRAY:
  DUP Item*ItemArraySize
    defb #ff; item.itemID = #ff - признак того что предмета нет 
  EDUP
ITEM_ARRAY_END:

  ORG ITEM_ARRAY ; начинаем с метки описания массива и заполняем массив

  ; Item Chair.item, 4,6, Floor.spr, #ff, 00
  ; Item Chair.item, 4,12, Floor.spr, #ff, 00
  ; Item Chair.item, 4,18, Floor.spr, #ff, 00
  
  ; Item Chair.item, 11,6, Floor.spr, #ff, 00
  ; Item Chair.item, 11,12, Floor.spr, #ff, 00
  
  ; Item Chair.item, 6,7, Floor.spr, #ff, 00
  ; Item Chair.item, 6,9, Floor.spr, #ff, 00
  ; Item Chair.item, 6,13, Floor.spr, #ff, 00
  ; Item Chair.item, 6,15, Floor.spr, #ff, 00

  ; Item Chair.item, 8,7, Floor.spr, #ff, 00
  ; Item Chair.item, 8,9, Floor.spr, #ff, 00
  ; Item Chair.item, 8,13, Floor.spr, #ff, 00
  ; Item Chair.item, 8,15, Floor.spr, #ff, 00

  ; Item Chair.item, 5,21, Floor.spr, #ff, 00
  ; Item Chair.item, 5,22, Floor.spr, #ff, 00
  ; Item Chair.item, 5,23, Floor.spr, #ff, 00
  ; Item Chair.item, 3,22, Floor.spr, #ff, 00

; тайник
  ; Item Chair.item, 21,30, FloorWhite.spr, #ff, 00

; склад
  ; Item Canister.item, 10,16, FloorRed.spr, #ff, 00
  ; Item CanisterEmpty.item, 10,17, FloorRed.spr, #ff, 00
  ; Item CanisterEmpty.item, 11,16, FloorRed.spr, #ff, 00

; лаборатория
  ; Item CanisterEmpty.item, 25,6, FloorWhite.spr, #ff, 00
  ; Item CanisterEmpty.item, 28,6, FloorWhite.spr, #ff, 00

; генераторная
  ; Item CanisterEmpty.item, 25,19, Nipple.spr, #ff, 00
  ; Item CanisterEmpty.item, 25,17, Nipple.spr, #ff, 00
  ; Item CanisterEmpty.item, 26,17, Nipple.spr, #ff, 00
  ; Item CanisterEmpty.item, 27,17, Nipple.spr, #ff, 00

; заросли
  ; Item CanisterEmpty.item, 18,9, Grass.spr, #ff, 00

  ; Item Wrench.item, 11,17, FloorRed.spr, #ff, 00

  ; Item Nippers.item, 11,11, Floor.spr, #ff, 00
  ; Item Nippers.item, 17,10, Grass.spr, #ff, 00

  ; Item RedCard.item, 27,3, FloorWhite.spr, #ff, 00
  ; Item RedCard.item, 3,11, FloorWhite.spr, #ff, 00
  ; Item RedCard.item, 4,11, FloorWhite.spr, #ff, 00
  ; Item RedCard.item, 5,11, FloorWhite.spr, #ff, 00

; проверяем что не вышли за границу таблицы предметов
  ASSERT ITEM_ARRAY_END >= $

  ORG ITEM_ARRAY_END ; блок должен занимать положенное кол-во байт, даже если предметов меньше
