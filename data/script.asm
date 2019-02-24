BEGIN_SCRIPT:
  setBorder PEN_BLACK
  ; goto game_over_3
  printScreen PAPER_BLACK or PEN_GREEN, HELLO_TXT
  CallCode binary_play_intro
  CallCode binary_init
  ; CallScript Nipple.power_start_

; fixed
; закрытие зеленой двери тоже по клику при включенном питании
; закрытие зеленой двери ломиком
; ключом-ломиком тоже можно ломать стулья кровати и столы

; TODO
; _пустой_ короб для электроники
; сообщение о том что растение не пролезает в биосборник
; сообщение о том что человек не пролезает в биосборник
; ломаем биоконтейнер
; убрать на складе мягкую обшивку слева вверху дабы не смущать
; при финале press g to restart надо а то иногда схлопывается
; звук при заборе контейнером материала

; непонятно что подсадили клону часть днк от объекта N1
; клон 'xx xxx' [Режим: запись информации в носителя...]
; разбитие анализаторов и ментосканеров
; решетку из комнаты совещаний в кабинет начальника для симметрии снизу

; при движении с ломиком на зеленую дверь она открыается(?)
; затыкать чем-то дыры в стенах(!)
; компьютер в комнате начальника активация (?)
; когда встал на кровать при включенной электроэнергии то убивает ментоизлучением(?)
; красный биоконтейнер (?)

LOOP_SCRIPT:
  CallScript GAME_LOOP
  IfVarN Vars.game_over, 0, game_over
  goto LOOP_SCRIPT
  defb _endByte

; ABOUT_INTRO:
;   CallCode binary_clear_screen
;   setScreen PAPER_BLACK or PEN_GREEN
;   printAt 0,0,ABOUT_TXT
;   CallCode input.waitKey
;   goto BEGIN_SCRIPT
;   defb _endByte

; HELP_SCRIPT_INTRO:
;   CallCode binary_clear_screen
;   setScreen PAPER_BLACK or PEN_GREEN
;   printAt 0,0,HELP
;   ; shiruFX 46
;   CallCode input.waitKey
;   goto BEGIN_SCRIPT
;   ; CallCode input.noKey
;   ; CallCode binary_show_screen
;   defb _endByte

; HELP_SCRIPT:
;   CallCode binary_clear_screen
;   setScreen PAPER_BLACK or PEN_CYAN
;   printAt 0,0,HELP
;   shiruFX 46
;   CallCode input.waitKey
;   CallCode input.noKey
;   CallCode binary_show_screen
;   defb _endByte

END_SCRIPT:
  shiruFX 46
  CallCode input.waitKey
  CallCode input.noKey
  goto RESTART

game_over:
  ; CallCode binary_clear_screen
  ; goto game_over_3
  IfVar Vars.game_over, 2, game_over_2
  IfVar Vars.game_over, 3, game_over_3
  IfVar Vars.game_over, 4, game_over_4
  IfVar Vars.game_over, 5, game_over_5

game_over_1:
  printScreen PAPER_BLACK or PEN_RED, GAMEOVER_1
  CallCode play_gameover
  goto RESTART
  
game_over_2
  printScreen PAPER_BLACK or PEN_RED, GAMEOVER_2
  CallCode play_gameover
  goto RESTART

game_over_3
  printScreen PAPER_BLACK or PEN_YELLOW, GAMEOVER_3
  CallCode play_gameover
  printScreen PAPER_BLACK or PEN_WHITE, GAMEOVER_3_1
  CallCode play_gameover
  goto RESTART

game_over_4
  printScreen PAPER_BLACK or PEN_GREEN, GAMEOVER_4
  CallCode play_happy
  printScreen PAPER_BLACK or PEN_WHITE, GAMEOVER_4_0
  CallCode play_happy
  goto RESTART

game_over_5
  printScreen PAPER_BLACK or PEN_RED, GAMEOVER_5
  CallCode play_gameover
  goto RESTART

; binary_clear_screen:
;   LD D, 0
;   LD E, 24
;   CALL screenfx.clear_window
;   RET

binary_init:
  ; LD DE, #1008
  ; LD ( Vars.Cursor_pos ), DE
  CALL Entities.initHeroes
  CALL Entities.lookChar
  RET

GAME_LOOP:
  ; IfVar Vars.var_mode, 1, cursor_look
  ScanKeyTable key_table_hero
  wait_halt 1
  ; CallCode screenfx.show_frames
  ; CallScript look_char
  defb _endByte

binary_play_intro:
  LD A, (IS_GAME_OVER)
  AND A
  JR Z, play_normal
  DEC A
  JR Z, play_happy
play_gameover:
  LD HL, gameover.MUSICDATA
  JP just_play
play_normal:
  LD HL,MUSICDATA
  JP just_play
play_happy:
  LD HL, gameend.MUSICDATA
  JP just_play

just_play:
  CALL TRI_PLAY
  CALL input.noKey
  RET
  
binary_show_screen:
  CALL Entities.lookChar
  
; показать GUI поверх карты =)
binary_show_gui:

show_hand_item:
  CALL items.get_hero_hand_item
  JR NC, binary_show_gui_ret
  LD DE, #0101
  CALL screenfx.show_sprite

binary_show_gui_ret:
  RET

; key_table_intro:
;   ; KEY_H, HELP_SCRIPT_INTRO
;   KEY_I, ABOUT_INTRO
;   defb _endByte

key_table_hero:
  KEY_CAPS_SHIFT, scan_cursor_keys

  KEY_N, next_char

  KEY_Q, char_up
  KEY_A, char_down
  KEY_O, char_left
  KEY_P, char_right

  ; KEY_I, set_cursor_look

  ; KEY_H, HELP_SCRIPT

  KEY_G, RESTART

  KEY_ENTER, char_loot
  KEY_M, char_loot
  KEY_SPACE, char_loot

  defb _endByte

; set_cursor_look:
  ; CallCode binary_calc_hero_cursor_pos
  ; SetVar Vars.var_mode, 1; cursor_look
  ; CallCode input.noKey
  ; defb _endByte

; binary_calc_hero_cursor_pos
  ; CALL Entities.calc_hero_cursor_pos
  ; ADD HL, HL
  ; LD ( Vars.Cursor_pos ), HL
  ; RET

scan_cursor_keys:
  ScanKeyTable cursor_table_hero
  defb _endByte

cursor_table_hero:
  KEY_8, char_right
  KEY_7, char_up
  KEY_6, char_down
  KEY_5, char_left
  defb _endByte

; LOOK_CURSOR_LOOP:
  ; SkanKeyTable cursor_table_hero
  ; wait_halt 1
  ; CallCode screenfx.show_frames
  ; goto LOOK_CURSOR_LOOP
  ; CallScript look_char
  ; defb _endByte


RESTART
    ; CallCode zxengine.clear_data
    CallCode zxengine.init; переходим на инициализацию

next_char:
    CallCode Entities.loopNextChar
look_char:
    CallCode Entities.lookChar
    CallCode binary_show_gui
    ; CallCode input.noKey ; ждем пока отпустит клавишу
    ; wait_halt 5
    defb _endByte

char_up:
  ; CharDo do_stand, dir_up
  CharRotMove dir_up
  ; CallCode Entities.lookCharSeeCellInfo
  ; CharDoForward do_stand
  goto look_char

char_down:
  ; CharDo do_stand, dir_down
  CharRotMove dir_down
  ; CallCode Entities.lookCharSeeCellInfo
  goto look_char

char_left:
  ; CharRotLeft
  ; CharDo do_stand, dir_left
  CharRotMove dir_left
  ; CallCode Entities.lookCharSeeCellInfo
  goto look_char

char_right:
  ; CharDo do_stand, dir_right
  ; CharRotRight
  CharRotMove dir_right
  ; CallCode Entities.lookCharSeeCellInfo
  goto look_char

; char_up_left:
;   CharDo do_stand, dir_up_left
;   goto look_char
; char_up_right:
;   CharDo do_stand, dir_up_right
;   goto look_char
; char_down_left:
;   CharDo do_stand, dir_down_left
;   goto look_char
; char_down_right:
;   CharDo do_stand, dir_down_right
;   goto look_char

char_loot:
  ; CharDo do_get_drop, dir_center
  CharDoDir do_get_drop
  CallCode input.noKey
  goto look_char