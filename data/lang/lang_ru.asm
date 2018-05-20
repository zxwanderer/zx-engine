;  Windows-1251 encoded only !!!!

HELLO_TXT:
  db "ПРИВЕТ МИР!!!! Привет мир! Это очередная   игра на движке zx-engine, которая потихоньку пишется. "
  db "На самом деле конечно ничего уже не пишется и не будет, все пройдет незамеченым. "
  db "Про это собственно и игра"
  db _endByte

CELL_TYPE_NAMES:
Empty_cell_name: db "Нечто",0
Floor_cell_name: db "Плитка",0
Computer_cell_name: db "Терминал",0
Door_cell_name: db "Дверь",0
Wall_cell_name: db "Стена",0
Ballon_cell_name: db "Баллон",0

tHeroName1 defb "Иван Ребрин",0
tHeroName2 defb "Виталий Капустин",0