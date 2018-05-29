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
  setBorder PEN_BLACK
LOOP_SCRIPT:
  ; setBorder PEN_BLACK
  CallScript GAME_LOOP
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
  ; setBorder PEN_RED
  SkanKeyTable key_table_hero
  ; AddItemMap 13,22, Shard_Item
  ; ShowSprite 1,5,1
  defb _endByte

; читаем id предмета в руках
binary_hand_to_var:
  CALL items.get_hero_hand_item
  setVar zxengine.var_item_id, A; если A = 0 то предмета нет )
  RET

; показать GUI поверх карты =)
binary_show_gui:

; проверяем стоит ли герой на каком-нибудь предмете
show_ground_item:
  LD IX, (Entities.activePersonage_ptr)
  LD DE, (IX+Entities.Hero.pos)
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

  LD D, 0
  LD E, 1
  CALL screenfx.clear_window
  CALL screenfx.show_frames
  RET

binary_get_or_drop_item:
; сначала смотрим есть ли предмет на земле
binary_get_item_from_map:
  LD IY, (Entities.activePersonage_ptr)
  LD DE, (IY+Entities.Hero.pos)
  CALL items.find_item_on_map
  JR C, binary_drop_item_to_map; предмета на земле нет - переходим на проверку бросания
  ; LD A, Hero_hand_item_spr
  LD (IY+Entities.Hero.sprite), Hero_hand_item_spr
  JP items.pick_up_item

binary_drop_item_to_map:
  ; смотрим есть ли предмет в руках?
  LD A, (IY+Entities.Hero.hand_right_p_1)
  AND A
  RET Z; бросить ничего не можем - возврат
  LD HL, (IY+Entities.Hero.hand_right_p)
  PUSH HL
  POP IX
  LD (IY+Entities.Hero.sprite), Hero_hand_empty
  JP items.drop_down_item

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

char_loot:
  CallCode binary_get_or_drop_item
  goto look_char