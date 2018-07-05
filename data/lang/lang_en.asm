;  Windows-1251 encoded only !!!!

HELLO_TXT:
; db "012345678901234567890123456789012345678901"
  db " CELL 3326       v0.1.3.1[en]  05.07.2018 "
  db "------------------------------------------"
  db "Hello world! This is a small testing mini-"
  db "game. Main target - leave the room :)     "
  db "------------------------------------------"
  db " Tools used in development:               "
  db " - Z80 assembler sjasmplus                "
  db " - beepFX engine and samples by Shiru     "
  db " - text editor Visual Studio Code         "
  db " - tile map editor Tiled                  "
  db " - sprite editor Aseprite                 "
  db " - graphic editor ZX-Paintbrush           "
  db " - Unreal Speccy Portable                 "
  db " - packer zx7                             "
  db " - bin2tap for tape-version               "
  db "Some ideas and code were borrowed from    "
  db "game sources by SamStyle and SancheZ.     "
  db "The font comes from Trip game by STD.     "
  db "------------------------------------------"
  db "my e-mail: wanderer[@]amberskynet.org"
  db _endByte

HELP:
  db "------------------------------------------"
  db " [H]elp                                   "
  db "------------------------------------------"
  db "                                          "
  db "H-BIG main key, shows this help screen :) "
  db "                                          "
  db "G - restart game ( exit to menu )         "
  db "                                          "
  db "QWEDCXZA-movement like a Rebel Star game  "
  db "                                          "
  db "Enter - drop or take an item to hand      "
  db _endByte

GAMEOVER_1:
  db "------------------------------------------"
  db "Happy end!                                "
  db "------------------------------------------"
  db "I hit the terminal with a chair...        "
  db "It exploded with a deafening blow,        "
  db "piercing my body with sharp fragments     "
  db "of plastic and hot metal.                 "
  db "------------------------------------------"
  db "The hero is died, so it happened...       "
  db _endByte

GAMEOVER_2:
  db "------------------------------------------"
  db "Congratulations!                          "
  db "------------------------------------------"
  db "The doors slide open and I left the cell  " 
  db "to the corridor, trying to remember how   "
  db "I got here and what to do next ..         "
  db "------------------------------------------"
  db "You have successfully passed              "
  db "the mini-game, hurray-hurray!             "
  db _endByte

varDoorUnlock equ 100; признак открытия двери

CELL_TYPE_NAMES:
Empty_cell_name: db "Something",0
Floor_cell_name: db "Floor",0
Computer_cell_name: db "Terminal",0
Door_cell_name: db "Door",0
Wall_cell_name: db "Wall",0
Ballon_cell_name: db "Ballon",0
Bed_cell_name: db "Bed",0
Trash_cell_name: db "Small debris and trash",0

Soft_wall_name: db "Decorative wall",0

Shard_item_name: db "Shard",0
Chair_item_name: db "Chair",0

Electronic_cell_name: db "Electronic control unit ",0
Electronic_break_name: db "Broken electronic", 0

tHeroName1 defb "Robot",0
tHeroName2 defb "HOMO",0

Electronic_break_mess:
  db "And so everything is broken..",0

Soft_wall_show_electronic:
  db "A control panel was found..",0

Electronic_kick_mess:
  db "Fragile electronic block broke..",0

Electronic_kick_open_mess:
  db "Done! Power from the door is removed.",0

Door_kick_chair_mess:
  db "It's useless. Door don't budged.",0

Door_kick_shard_mess:
  db "The door does not even scratch.",0

Door_not_open_mess:
  db "The door did not open.",0

Take_bed_mess:
  db "The bed was attached to the floor and     "  
  db "did not go up.",0

Take_floor_mess:
  db "There was nothing on the floor.",0

Take_trash_mess:
  db "Small debris and trash.. Uselesses.",0

Take_chair_mess
  db "I picked up a chair..",0

Wall_mess:
  db "I knocked my foot on the heavy armored    "
  db "plate.. To no avail.",0

Break_shard_mess
  db "A sharp piece of plastic splintered       "
  db "in my the hands..",0

Take_shard_mess
  db "I picked up a sharp piece of plastic..",0

Shard_to_soft_wall_mess
  db "I cut a hole with a sharp piece           "
  db "of plastic in the soft decorative wall ",0

Soft_wall_clean
  db "I removed the remains of the decorative   "
  db "wall.",0

Computer_break_mess 
  db "The chair fell apart, but the terminal    "
  db "screen cracked.",0

Computer_add_shard_mess 
  db "Another powerful hit and the terminal     "
  db "was completely broken.",0

Soft_wall_hit_mess:
  db "The impact was absorbed by the soft wall..",0

Soft_wall_hit_item_mess:
  db "Useless. The impact was absorbed          "
  db "by the soft wall.",0

Computer_off_mess:
  db "I pressed the keys in random order and    "
  db "the terminal turned off...",0

Computer_off_hit_mess:
  db "It's offline..", 0
