MODULE Vars

; системные переменные в Engine для использования
var_act equ 0; // переменная 0 - действие
var_ret equ 1; // переменная 1 - что возвратили из скрипта
var_pos_y equ 2
var_pos_x equ 3
MapCell_xy equ zxengine.varsTab+2; положение воздействия автоматом доступно из скриптов если пишется в переменные Engine =)
var_item_id equ 4; id активного предмета
game_over equ 5; вариант окончания игры
cursor_pos_y equ 6
cursor_pos_x equ 7
Cursor_pos equ zxengine.varsTab+6; позиция курсора на экране
Cursor_pos_y equ zxengine.varsTab+6; позиция курсора на экране
Cursor_pos_x equ zxengine.varsTab+7; позиция курсора на экране

ENDMODULE
