MAP_MASK:
  DUP mapSize*mapSize
  defb 0; 0 - ячейка еще не просмотрена
  EDUP
MAP_MASK_END

MAP_SET:
  incbin "map.bin"
  ; include "data/maps/laboratory3.asm"
MAP_SET_END

  include "data/heroes.asm"
