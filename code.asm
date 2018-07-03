  jp zxengine.init

  include "core/defines.asm"
  include "middlware/defines.asm"
  include "middlware/defines/CellType.asm"
  include "middlware/defines/ItemType.asm"
  include "middlware/defines/Item.asm"
  include "middlware/defines/Hero.asm"

  include "core/scankeys.asm"
  include "core/engine.asm"
  include "core/routines/math.asm"
  include "core/routines/tiles16.asm"
  include "core/routines/input.asm"
  include "core/routines/zx7.a80"
  include "middlware/beeper.asm"
  include "middlware/screenfx.asm"
  include "middlware/text.asm"
  include "middlware/screen.asm"
  include "middlware/map.asm"
  include "middlware/defines/Vars.asm" ; если разместить в начале, то тупой компилятор ругается на forvard reference из-за ссылки на zxengine.varsTab несмотря на два прохода
  include "middlware/entities.asm"
  include "middlware/items.asm"
  include "core/interrupt.asm"