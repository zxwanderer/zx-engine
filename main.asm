DEVICE zxspectrum128

ORG     #8000
code_start:
  JP zxengine.start
  include "core/engine.asm"
  include "core/defines.asm"
  include "middlware/beeper.asm"

START_SCRIPT
  setBorder PEN_YELLOW
  setBorder PEN_RED
  setBorder PEN_BLACK
  setBorder PEN_BLUE
  goto START_SCRIPT
  defb _endByte

SAVESNA "myzx.sna",code_start
