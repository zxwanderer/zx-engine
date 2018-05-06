DEVICE zxspectrum128

ORG     #8000
code_start:

  JP zxengine.start
  include "core/engine.asm"
  include "core/defines.asm"
  include "middlware/beeper.asm"

START_SCRIPT
  setBorder PEN_BLACK
  wait 10
  setBorder PEN_BLUE
  wait 20
  setBorder PEN_RED
  wait 30
  setBorder PEN_PURPLE
  wait 40
  setBorder PEN_GREEN
  wait 50
  setBorder PEN_CYAN
  wait 60
  setBorder PEN_BLACK
  wait 7
  setBorder PEN_WHITE
  wait 125
  goto START_SCRIPT
  defb _endByte

SAVESNA "myzx.sna",code_start
