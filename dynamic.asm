MAP_MASK:
  DUP mapSize*mapSize
  defb 0
  EDUP

MAP_SET:
	; include "data/maps/laboratory.asm"
  ; include "data/maps/laboratory_old.asm"
  ; include "data/maps/laboratory_demo.asm"
  include "data/maps/test_lab.asm"

MAP_SET_END
  include "data/heroes.asm"
