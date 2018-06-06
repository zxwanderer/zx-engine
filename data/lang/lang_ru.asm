;  Windows-1251 encoded only !!!!

HELLO_TXT:
  ; db "012345678901234567890123456789012345678901"

  db "-- [MURK 3326]      [v0.1 от 6.06.2018] --"
  db "Привет мир! Это пробная мини-дема игры.   "
  db "Цель - покинуть комнату :)                "
  db "------------------------------------------"
  db "При разработке были использованы:         "
  db " -компилятор ассемблера sjasmplus         "
  db " -биперный движок beepFX от Shiru         "
  db " -текстовый редактор Visual Studio Code   "
  db " -редактор тайловых карт Tiled            "
  db " -графический спрайтовый редактор Aseprite"
  db " -графический редактор ZX-Paintbrush      "
  db " -эмулятор Speccy Unreal Portable         "
  db "Некоторые идеи и код были позаимствованы  "
  db " из исходников движков SamStyle и SancheZ."
  db "Шрифт взят из игры Trip от STD.           "
  db "------------------------------------------"
  db "My respect to coders: kalantaj, Wiev      "
  db "Шыншыл and big rusiian demoscene boss AAA,"
  db "also special thanks to Alone Coder for    "
  db "some z80 ideas and IDE cable :)           "
  db "------------------------------------------"
  db "my email: wanderer[@]amberskynet.org"
  db _endByte

CELL_TYPE_NAMES:
Empty_cell_name: db "Нечто",0
Floor_cell_name: db "Плитка",0
Computer_cell_name: db "Терминал",0
Door_cell_name: db "Дверь",0
Wall_cell_name: db "Стена",0
Ballon_cell_name: db "Баллон",0
Bed_cell_name: db "Кровать",0
Trash_cell_name: db "Мелкие обломки и мусор",0

Soft_wall_name: db "Стена",0

Shard_item_name: db "Осколок",0
Chair_item_name: db "Стул",0

Electronic_cell_name: db "Электронный блок управления",0
Electronic_break_name: db "Сломанная электроника", 0

tHeroName1 defb "Робот",0
tHeroName2 defb "HOMO",0

Electronic_break_mess:
  db "И так уже все сломано дальше некуда...    ",0

Soft_wall_show_electronic:
  db "Под декоративной стенкой обнаружилась     "
  db "панель управления..",0

Electronic_kick_mess:
  db "Хрупкие микросхемы сломались!!",0

Electronic_kick_open_mess:
  db "Так,посмотрим. Замкнуть один провод здесь "
  db "и перерезать два тут.. Готово!",0

Door_kick_chair_mess:
  db "Безрезультатно. Дверь даже не шелохнулась.",0

Door_kick_shard_mess:
  db "На двери не осталось ни царапины..",0

Door_not_open_mess:
  db "Дверь не открывалась..",0

Take_bed_mess:
  db "Кровать была прикреплена к полу и не      "
  db "поднималась.. ",0

Take_floor_mess:
  db "На полу ничего не было..",0

Take_trash_mess:
  db "Мелкие обломки и мусор.. Бесполезное.",0

Take_chair_mess
  db "Я подобрал стул..",0

Wall_mess:
  db "Я стукнул ногой по тяжелой бронированой   "
  db "плите... Безрезультатно.",0

Break_shard_mess
  db "Острый кусок пластика раскололся в руках..",0

Statis_on_mess
  db "Я нажал на кнопки и над кроватью загудел   "
  db "сверкающий колпак статис-поля...",0

Take_shard_mess
  db "Я подобрал острый осколок пластика..",0

Shard_to_soft_wall_mess
  db "Острым осколком я прорезал дырку в мягкой "
  db "декоративной стенке..",0

Soft_wall_clean
  db "Я содрал остатки декоративной стенки",0

Computer_break_mess 
  db "Стул в руках развалился, но зкран компью- "
  db "тера треснул..",0

Computer_add_shard_mess 
  db "Еще один хороший удар и компьютер был     "
  db "полностью разбит..",0

Soft_wall_hit_mess:
  db "Мягкая стенка полностью поглотила удар..",0

Computer_off_mess:
  db "Я понажимал клавиши наугад и компьютер     "
  db "выключился..", 0

Computer_off_hit_mess:
  db "Выключено..", 0
