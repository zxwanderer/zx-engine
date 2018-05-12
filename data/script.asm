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
LOOP_SCRIPT:
  setBorder PEN_BLACK
  /* setBorder PEN_BLUE */
  setBorder PEN_RED
  CallCode test_proc
  goto LOOP_SCRIPT
  defb _endByte

GAME_LOOP:
  setBorder PEN_GREEN
  defb _endByte
