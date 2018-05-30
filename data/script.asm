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
  CallCode input.waitKey
  CallCode binary_init
  ; setBorder PEN_BLACK
  CallCode zxengine.start_measure
LOOP_SCRIPT:
  ; wait_halt 1
  ; setBorder PEN_RED
  CallScript GAME_LOOP
  ; setBorder PEN_BLACK
  goto LOOP_SCRIPT
  defb _endByte

binary_init:
  ; CALL items.initItems
  CALL Entities.initHeroes
  CALL Entities.lookChar
  ; LD A, Shard_Item
  ; LD DE, #0505
  ; CALL items.add_item_to_map
  ; LD D, 0
  ; LD E, 24
  ; CALL screenfx.clear_window
  RET

GAME_LOOP:
  SkanKeyTable key_table_hero
  ; wait_halt 1
  ; CallCode screenfx.show_frames
  ; CallScript look_char
  ; CallCode zxengine.stop_measure
  ; CallCode zxengine.start_measure
  defb _endByte

; читаем id предмета в руках
binary_hand_to_var:
  CALL items.get_hero_hand_item
  setVar zxengine.var_item_id; если A = 0 то предмета нет )
  RET

; показать GUI поверх карты =)
binary_show_gui:
  ; CALL zxengine.start_measure

; проверяем стоит ли герой на каком-нибудь предмете
show_ground_item:
  LD IX, (Entities.activePersonage_ptr)
  ; LD DE, (IX+Entities.Hero.pos)
  LD D, (IX+Entities.Hero.pos.x)
  LD E, (IX+Entities.Hero.pos.y)
  CALL items.find_item_on_map ; в IX указатель на найденный предмет
  JR C, show_hand_item; не стоит
  LD A, (IX+items.Item.itemID)
  CALL items.calcItemType
  LD A,(HL)
  LD DE, #1D01
  CALL screenfx.show_sprite

show_hand_item:
  CALL items.get_hero_hand_item
  JR NC, binary_show_gui_ret
  LD DE, #0101
  CALL screenfx.show_sprite

binary_show_gui_ret:
  ; CALL zxengine.stop_measure
  ; LD D, 0
  ; LD E, 1
  ; CALL screenfx.clear_window
  ; HALT
  ; CALL screenfx.show_frames
  RET

; для корректного вызова скрипта обработки предмета 
; нужно знать откуда брать его id - 
;       предмет может быть в руках персонажа
;       предмет может лежать на карте
;       или это может быть просто ячейка карты
; поэтому все это придется закодировать в CharDo
; а все богатство возможных последствий придется закодировать в 
; скриптах

binary_get_or_drop_item:
    RET
;   LD IY, (Entities.activePersonage_ptr)
  
;   LD A, (IY+Entities.Hero.hand_right_p_1) ; сначала смотрим пустые ли руки %) (!!!)
;   OR A
;   JR NZ, binary_drop_item_to_map; что-то в руках есть - кидаем это!

; binary_get_item_from_map:

  ; LD A, 6
  ; CALL FX_SET
  ; RET

; binary_drop_item_to_map:

;   LD A, 5
;   CALL FX_SET

;   RET

  /*  
  LD IY, (Entities.activePersonage_ptr)
  
  LD A, (IY+Entities.Hero.hand_right_p_1) ; сначала смотрим пустые ли руки %) (!!!)
  OR A
  JR NZ, binary_drop_item_to_map; что-то в руках есть - кидаем это!

  LD A, 6
  CALL FX_SET

; binary_get_item_from_map:
  LD DE, (IY+Entities.Hero.pos)
  LD B, Entities.do_take
  JP Entities.check_action
  
binary_drop_item_to_map:
  ; смотрим есть ли предмет в руках?
  LD A, (IY+Entities.Hero.hand_right_p_1)
  AND A
  RET Z; бросить ничего не можем - возврат
  ; LD HL, (IY+Entities.Hero.hand_right_p)
  LD L, (IY+Entities.Hero.hand_right_p)
  LD H, (IY+Entities.Hero.hand_right_p_1)
  PUSH HL
  POP IX
  LD (IY+Entities.Hero.sprite), Hero_hand_empty
  JP items.drop_down_item
*/

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

  KEY_ENTER, char_loot

  defb _endByte

next_char:
    CallCode Entities.loopNextChar
look_char:
    CallCode Entities.lookChar
    CallCode binary_show_gui
    ; CallCode input.noKey ; ждем пока отпустит клавишу
    ; wait_halt 5
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

char_loot:
  CallCode binary_get_or_drop_item
  goto look_char