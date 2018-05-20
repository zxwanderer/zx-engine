    MODULE Entities

activePersonage_ptr:
    dw #0000 ; указатель на текущего персонажа
RevertPersonageNum:
    db #00 ; инверсный номер персонажа ( от PersonagesNum до 0!!!)

; тип ячейки на карте или предмета
STRUCT CellType
name_ptr dw 00; указатель на имя типа
script_ptr dw 00; указатель на скрипт обработки действий если нужен, иначе 0000
;--- разные части
;prot db 00; проницаемость для предметов, 00 - полностью проницаем
;force_destr db 00; сила для уничтожения
ENDS

STRUCT Hero
pos Point 0,0 ; позиция на карте
sprite db 00; текущий спрайт
ground db 00; на чем стоит
flags db 00; признаки-флаги
name_p dw #0000
; --- инвентарь
; head db 00
; mask db 00
; left_hand db 00
; righ_hand db 00
; torse db 00
; boot db 00
ENDS

; ------- инициализация на карте всех персонажей из CHAR_SET
initHeroes:
  LD HL, CHARS_SET
PersonagesNum_ptr:
  LD B, PersonagesNum
init_loop; пробегаемся по всем персонажам и размещаем их на карте
  LD DE, Hero
  PUSH BC
  PUSH DE
  PUSH HL
  LD IX,HL

  LD DE, (IX+Hero.pos)
  call map.calc_pos
  LD A,(HL)
  LD (IX+Hero.ground),A; ячейку карты ставим на пол персонажа
  LD A,(IX+Hero.sprite)
  LD (HL),A ; ставим спрайт персонажа на карту
  POP HL
  POP DE
  POP BC
  ADD HL, DE
  DJNZ init_loop
  JP firstChar

; перебираем по кругу персонажей от стартового до последнего и опять на первый
loopNextChar:
  CALL nextChar
  RET NZ
firstChar:
  LD DE, CHARS_SET
  ld (activePersonage_ptr), DE
  LD A, PersonagesNum
  LD (RevertPersonageNum), A
  RET

nextChar: ; если у нас признак Z в 1 значит достилги конца массива
  LD A, (RevertPersonageNum)
  DEC A
  RET Z; если у нас обнулился счетчик - возвращаемся
  LD (RevertPersonageNum), A
  LD DE, (activePersonage_ptr)
  LD HL, Hero
  ADD HL, DE
  LD (activePersonage_ptr), HL
  OR 2
  RET  

lookChar:; смотрим на текущего персонажа
  LD IX, (activePersonage_ptr)
  LD DE, (IX+Hero.pos)
  CALL map.center_map
  JP Tiles16.show_tile_map
  RET

    ENDMODULE
