  include "ItemType_h.asm"

ITEM_TYPES:
  DUP ItemType*100
    defb 00
   EDUP
ITEM_TYPES_END equ $
