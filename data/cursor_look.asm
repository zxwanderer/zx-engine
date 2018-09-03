
cursor_look:
  CallCode cursor.show_cursor
  wait_halt 1
  SkanKeyTable cursor_table_look
  defb _endByte

cursor_post_update:
  CallCode Entities.lookChar
  CallCode binary_show_gui
  CallCode binary_show_cell_info
  defb _endByte

cursor_table_look:
  KEY_Q, cursor_up
  KEY_A, cursor_down
  KEY_O, cursor_left
  KEY_P, cursor_right

  KEY_8, cursor_right
  KEY_7, cursor_up
  KEY_6, cursor_down
  KEY_5, cursor_left

  KEY_I, cursor_ret
  defb _endByte

cursor_ret:
  SetVar Vars.var_mode, 0
  CallCode input.noKey ; ждем пока отпустит клавишу
  goto look_char
  ; defb _endByte

cursor_up:
  CallCode cursor.up
  goto cursor_post_update

cursor_down:
  CallCode cursor.down
  goto cursor_post_update

cursor_left:
  CallCode cursor.left
  goto cursor_post_update

cursor_right:
  CallCode cursor.right
  goto cursor_post_update

binary_show_cell_info:
    CALL cursor.getCell
    CALL Entities.calc_cell_type; в HL указатель на опмсание типа ячейки
    LD (binary_show_cell_info_ptr+1), HL
binary_show_cell_info_ptr
    LD HL, (#0000)
    CALL screenfx.show_info_message
    RET