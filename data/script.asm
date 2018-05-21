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
  setBorder PEN_BLACK
LOOP_SCRIPT:
  setBorder PEN_BLACK
  CallScript GAME_LOOP
  goto LOOP_SCRIPT
  defb _endByte

GAME_LOOP:
  ; setBorder PEN_RED
  SkanKeyTable key_table_hero
  ; ShowSprite 1,5,1
  defb _endByte

binary_init:
  CALL Entities.initHeroes
  CALL Entities.lookChar
  RET

; binary_proc:
  ; LD HL, CHARS_SET
  ; LD ( Entities.activePersonage_ptr), HL
  ; CALL Entities.loopNextChar
  ; CALL Entities.lookChar
  ; RET

key_table_hero:
  KEY_N, next_char

  KEY_W, char_up
  KEY_X, char_down
  KEY_A, char_left
  KEY_D, char_right

  KEY_Q, char_up_left
  KEY_E, char_up_right
  KEY_Z, char_down_left
  KEY_C, char_down_right

  defb _endByte

next_char:
    CallCode Entities.loopNextChar
look_char:
    CallCode Entities.lookChar
    CallCode input.noKey ; ждем пока отпустит клавишу
    defb _endByte

char_up:
  CharDo Entities.do_stand, dir_up
  goto look_char
char_down:
  CharDo Entities.do_stand, dir_down
  goto look_char
char_left:
  CharDo Entities.do_stand, dir_left
  goto look_char
char_right:
  CharDo Entities.do_stand, dir_right
  goto look_char

char_up_left:
  CharDo Entities.do_stand, dir_up_left
  goto look_char
char_up_right:
  CharDo Entities.do_stand, dir_up_right
  goto look_char
char_down_left:
  CharDo Entities.do_stand, dir_down_left
  goto look_char
char_down_right:
  CharDo Entities.do_stand, dir_down_right
  goto look_char