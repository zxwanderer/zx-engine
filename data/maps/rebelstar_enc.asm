

; обозначаем номера сущностей для лучшей адресации например SetActionCell Door_open
Door_closed equ #02
Door_half_open equ #12
Door_open equ #22

Computer_on equ #04
Computer_off equ #14
Computer_break equ #24

CELL_TYPES:

; -- 0 --

Cell_Type_Empty:    Entities.CellType Empty_cell_name,    no_script ; 0
Cell_Type_Wall:     Entities.CellType Wall_cell_name,     wall_script ; 1
Cell_Type_Door:     Entities.CellType Door_cell_name,     door_script ; 2
Cell_Type_Floor:    Entities.CellType Floor_cell_name,    no_script ; 3
Cell_Type_Computer: Entities.CellType Computer_cell_name, computer_on_script ; 4
Cell_Type_Ballon:   Entities.CellType Ballon_cell_name,   no_way_script ; 5
Cell_Type_GridWall: Entities.CellType Ballon_cell_name,   no_script ; 6
Cell_Type_Canister: Entities.CellType Ballon_cell_name,   no_script ; 7
Cell_Type_Palm:     Entities.CellType Ballon_cell_name,   no_script ; 8
Cell_Type_Human:    Entities.CellType Ballon_cell_name,   no_script ; 9

Cell_Type_0A:        Entities.CellType Ballon_cell_name,   no_script ; A
Cell_Type_0B:        Entities.CellType Ballon_cell_name,   no_script ; B
Cell_Type_0C:        Entities.CellType Ballon_cell_name,   no_script ; C
Cell_Type_0D:        Entities.CellType Ballon_cell_name,   no_script ; D
Cell_Type_0E:        Entities.CellType Ballon_cell_name,   no_script ; E
Cell_Type_0F:        Entities.CellType Ballon_cell_name,   no_script ; F

; -- 01 --

Cell_Type_10:        Entities.CellType Empty_cell_name,   no_script ; 0
Cell_Type_11:        Entities.CellType Empty_cell_name,   no_script ; 1
Cell_Type_12:        Entities.CellType Door_cell_name,    door_script ; 2
Cell_Type_13:        Entities.CellType Empty_cell_name,   no_script ; 3
Cell_Type_Off_Computer: Entities.CellType Computer_cell_name, computer_off_script ; 4
Cell_Type_15:        Entities.CellType Empty_cell_name,   no_script ; 5
Cell_Type_16:        Entities.CellType Empty_cell_name,   no_script ; 6
Cell_Type_17:        Entities.CellType Empty_cell_name,   no_script ; 7
Cell_Type_18:        Entities.CellType Empty_cell_name,   no_script ; 8
Cell_Type_19:        Entities.CellType Empty_cell_name,   no_script ; 9
Cell_Type_1A:        Entities.CellType Empty_cell_name,   no_script ; A
Cell_Type_1B:        Entities.CellType Empty_cell_name,   no_script ; B
Cell_Type_1C:        Entities.CellType Empty_cell_name,   no_script ; C
Cell_Type_1D:        Entities.CellType Empty_cell_name,   no_script ; D
Cell_Type_1E:        Entities.CellType Empty_cell_name,   no_script ; E
Cell_Type_1F:        Entities.CellType Empty_cell_name,   no_script ; F

; -- 02 --

Cell_Type_20:        Entities.CellType Empty_cell_name,   no_script ; 0
Cell_Type_21:        Entities.CellType Empty_cell_name,   no_script ; 1
Cell_Type_Door_Open: Entities.CellType Door_cell_name,    door_open_script ; 2
Cell_Type_23:        Entities.CellType Empty_cell_name,   no_script ; 3
Cell_Type_Computer_Break: Entities.CellType Computer_cell_name, computer_break_script ; 4
Cell_Type_25:        Entities.CellType Empty_cell_name,   no_script ; 5
Cell_Type_26:        Entities.CellType Empty_cell_name,   no_script ; 6
Cell_Type_27:        Entities.CellType Empty_cell_name,   no_script ; 7
Cell_Type_28:        Entities.CellType Empty_cell_name,   no_script ; 8
Cell_Type_29:        Entities.CellType Empty_cell_name,   no_script ; 9
Cell_Type_2A:        Entities.CellType Empty_cell_name,   no_script ; A
Cell_Type_2B:        Entities.CellType Empty_cell_name,   no_script ; B
Cell_Type_2C:        Entities.CellType Empty_cell_name,   no_script ; C
Cell_Type_2D:        Entities.CellType Empty_cell_name,   no_script ; D
Cell_Type_2E:        Entities.CellType Empty_cell_name,   no_script ; E
Cell_Type_2F:        Entities.CellType Empty_cell_name,   no_script ; F

; -- 03 --

Cell_Type_30:        Entities.CellType Empty_cell_name,   no_script ; 0
Cell_Type_31:        Entities.CellType Empty_cell_name,   no_script ; 1
Cell_Type_32:        Entities.CellType Empty_cell_name,   no_script ; 2
Cell_Type_33:        Entities.CellType Empty_cell_name,   no_script ; 3
Cell_Type_34:        Entities.CellType Empty_cell_name,   no_script ; 4
Cell_Type_35:        Entities.CellType Empty_cell_name,   no_script ; 5
Cell_Type_36:        Entities.CellType Empty_cell_name,   no_script ; 6
Cell_Type_37:        Entities.CellType Empty_cell_name,   no_script ; 7
Cell_Type_38:        Entities.CellType Empty_cell_name,   no_script ; 8
Cell_Type_39:        Entities.CellType Empty_cell_name,   no_script ; 9
Cell_Type_3A:        Entities.CellType Empty_cell_name,   no_script ; A
Cell_Type_3B:        Entities.CellType Empty_cell_name,   no_script ; B
Cell_Type_3C:        Entities.CellType Empty_cell_name,   no_script ; C
Cell_Type_3D:        Entities.CellType Empty_cell_name,   no_script ; D
Cell_Type_3E:        Entities.CellType Empty_cell_name,   no_script ; E
Cell_Type_3F:        Entities.CellType Empty_cell_name,   no_script ; F

; -- 04 --

Cell_Type_40:        Entities.CellType Empty_cell_name,   no_script ; 0
Cell_Type_41:        Entities.CellType Empty_cell_name,   no_script ; 1
Cell_Type_42:        Entities.CellType Empty_cell_name,   no_script ; 2
Cell_Type_43:        Entities.CellType Empty_cell_name,   no_script ; 3
Cell_Type_44:        Entities.CellType Empty_cell_name,   no_script ; 4
Cell_Type_45:        Entities.CellType Empty_cell_name,   no_script ; 5
Cell_Type_46:        Entities.CellType Empty_cell_name,   no_script ; 6
Cell_Type_47:        Entities.CellType Empty_cell_name,   no_script ; 7
Cell_Type_48:        Entities.CellType Empty_cell_name,   no_script ; 8
Cell_Type_49:        Entities.CellType Empty_cell_name,   no_script ; 9
Cell_Type_4A:        Entities.CellType Empty_cell_name,   no_script ; A
Cell_Type_4B:        Entities.CellType Empty_cell_name,   no_script ; B
Cell_Type_4C:        Entities.CellType Empty_cell_name,   no_script ; C
Cell_Type_4D:        Entities.CellType Empty_cell_name,   no_script ; D
Cell_Type_4E:        Entities.CellType Empty_cell_name,   no_script ; E
Cell_Type_4F:        Entities.CellType Empty_cell_name,   no_script ; F

  /* DUP Entities.CellType*256
  defb 00
  EDUP */

no_way_script: ; неуспех 
  SetVar zxengine.ret_var, 0
no_script:  ;  никак не нужно обрабатывать коллизию с сущностью
  defb _endByte

wall_script:
  ; rPlayVibr 1
  ;rBorder PEN_BLACK
  goto no_way_script

door_open_script:
  defb _endByte
  ; SetActionCell Door_half_open
  ; SetActionCell Door_closed
  ; goto no_way_script

; ----- проверяем дверь
door_script:
  ;rPlayLaser 1
  SetActionCell Door_half_open
  CallCode Entities.lookChar
  wait 5
  SetActionCell Door_open
  ; CallCode Entities.lookChar
  goto no_way_script

computer_on_script:
  ; rPlayLaser 1
  SetActionCell Computer_off
  goto no_way_script

computer_off_script:
  ; rPlayLaser 1
  SetActionCell Computer_on
  goto no_way_script

computer_break_script:
  goto no_way_script
  ;defb _endByte
  ; rPlayLaser 1
  ; GOTO no_way_script

;CellType2: Entities.CellType 0,0,tHeroName1
;CellType3: Entities.CellType 0,0,tHeroName1
;CellType4: Entities.CellType 0,0,tHeroName1

;CELL_TABLE:
;Cell_Empty: Entities.Cell Cell_Type_Empty, 0,0
/* Cell2: Entities.Cell 0,0
Cell3: Entities.Cell 0,0
Cell4: Entities.Cell 0,0 */

; массив соответствия кода спрайта на карте типу энкаунтера
;cells_types_spr:
  ;dw cGround, cWater, cGreenBush

; позиция Y,X !!!
/* pos Point 0,0 ; позиция на карте
sprite db 00; спрайт
ground db 00; на чем стоит
flags db 00; признаки-флаги
name_p dw #0000 */

PersonagesNum equ 2
; описываем героя:
CHARS_SET:
Hero1: Entities.Hero 31,31, 9, 0, 0, tHeroName1
Hero2: Entities.Hero 10,14, 9, 0, 0, tHeroName2
; , 0, 0, 0, 0, 0
;Hero3: Entities.Hero 22,22, 12, 0, 0, tHeroName2
;defb _endByte
