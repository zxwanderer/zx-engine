  /* setBorder PEN_BLACK */
  /* wait 10 */
  /* setBorder PEN_BLUE */
  /* wait 20 */
  /* setBorder PEN_RED */
  /* wait 30 */
  /* setBorder PEN_PURPLE */
  /* wait 40 */
  /* setBorder PEN_GREEN */
  /* wait 50 */
  /* setBorder PEN_CYAN */
  /* wait 60 */
  /* setBorder PEN_BLACK */
  /* wait 7 */
  /*  */
  /* wait 125 */
  setBorder PEN_BLACK
  setScreen PAPER_BLACK or PEN_GREEN
  printAt 0,0,HELLO_TXT
  CallCode binary_init
LOOP_SCRIPT:
  setBorder PEN_BLACK
  ; CallCode zxengine.halt_me
  ; setBorder PEN_BLUE
  ; setBorder PEN_RED
  ; setBorder PEN_GREEN
  ; CallCode test_proc
  CallCode binary_proc
  ; setBorder PEN_BLACK
  CallCode input.noKey
  CallCode input.waitKey
  CallCode input.noKey
  ; CallCode zxengine.halt_me
  setBorder PEN_GREEN
  goto LOOP_SCRIPT
  defb _endByte

GAME_LOOP:
  setBorder PEN_GREEN
  defb _endByte

binary_init:
  CALL Entities.initHeroes
  RET

binary_proc:
  ; LD HL, CHARS_SET
  ; LD ( Entities.activePersonage_ptr), HL
  CALL Entities.loopNextChar
  CALL Entities.lookChar
  RET