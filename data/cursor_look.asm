cursor_loop:
  CallCode cursor.show_cursor
  SkanKeyTable cursor_table_look
  wait 50
  goto cursor_loop

cursor_post_update:
    CallCode Entities.lookChar
    CallCode binary_show_gui
    CallCode binary_show_cell_info
    goto cursor_loop

cursor_table_look:
  KEY_8, cursor_right
  KEY_7, cursor_up
  KEY_6, cursor_down
  KEY_5, cursor_left
  defb _endByte

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
    LD HL, (#4000)
    CALL screenfx.show_info_message
    RET