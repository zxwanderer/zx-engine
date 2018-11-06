;  Windows-1251 encoded only !!!!

HELLO_TXT:
; db "012345678901234567890123456789012345678901"
  db " CELL 3326           v0.1.4.5  25.08.2018 "
  db "------------------------------------------"
  db "������ ���! � ���� �������� � ����� � ����"
  db "����. ����� ������� - �����, ����������   "
  db "������, ����������� �� ������� � �������. "
  db "���� - �������� �������.                  "
  db "------------------------------------------"
  db "                                          "
  db "�����:                                    "
  db "                                          "
  db "'H' ����� �������� ��� ���������� � ����  "
  db "                                          "
  db "'I' �������� ����������                   "
  db "                                          "
  db "����� ������ ��� ������ ����              "
  db "                                          "
  db "------------------------------------------"
  db "CODE: WANDERER / MUSIC: AER               "
  db "------------------------------------------"
  db "https://zxwanderer.github.io/cell3326     "
  db _endByte

ABOUT_TXT:
  db "------------------------------------------"
  db " [I]nfo                                   "
  db "------------------------------------------"
  db "��������� ���� �� ���������� ���� �����   "
  db "�� ���������� ��� �� SamStyle � SancheZ.  "
  db "------------------------------------------"
  db "������� �������� �������������� �� ���    "
  db "RebelStar, LaserSquad, ���-��� ����������."
  db "------------------------------------------"
  db "��� ���������� ���� ������������:         "
  db " -���������� ���������� Z80 sjasmplus     "
  db " -�������� ������ beepFX �� Shiru         "
  db " -��������� �������� Visual Studio Code   "
  db " -�������� �������� ���� Tiled            "
  db " -����������� ���������� �������� Aseprite"
  db " -����������� �������� ZX-Paintbrush      "
  db " -�������� Speccy Unreal Portable         "
  db " -��������� zx7                           "
  db " -������� bin2tap                         "
  db _endByte

HELP:
  db "------------------------------------------"
  db " [H]elp                                   "
  db "------------------------------------------"
  db "                                          "
  db " ������������:                            "
  db "                                          "
  db " ������� �������, � ��� ��                "
  db " Q - �����                                "
  db " A - ����                                 "
  db " O - �����                                "
  db " P - ������                               "
  db "                                          "
  db " Enter - ������� � ���� / ������� ������� "
  db "                                          "
  db " H - ����� ������� ( ��� ���� )           "
  db " G - ����� �� ���� � ����                 "
  db _endByte

GAMEOVER_1:
  db "------------------------------------------"
  db " ����� ����                               "
  db "------------------------------------------"
  db "� �� ���� ���� ������ ������ �� ������-   "
  db "����. �� ��������� � ������������� �����- "
  db "���, ������� ��� ���� ������� ���������   "
  db "�������� � �������� �������..             "
  db "------------------------------------------"
  db "����� �����, ��� �� ����������."
  db _endByte

GAMEOVER_2:
  db "------------------------------------------"
  db " GAME OVER!                               "
  db "------------------------------------------"
  db "������� ����� ���������� � � ����� �� ��- "
  db "���� � �������, ������� ��������� ��� ����"
  db "����� � ��� ������ ������..               "
  db "------------------------------------------"
  db "���������! �� ������� ������ ����-����,   "
  db "���-���-���!"
  db _endByte

; varDoorUnlock equ 100; ������� �������� �����

CELL_TYPE_NAMES:
Empty_cell_name: db " ",0
Floor_cell_name: db "������",0
Computer_cell_name: db "��������",0
Door_cell_name: db "�����",0
Wall_cell_name: db "������� ����������",0
Ballon_cell_name: db "������",0
Bed_cell_name: db "�������",0
Trash_cell_name: db "������ ������� � �����",0

Soft_wall_name: db "������������ �����",0

Shard_item_name: db "�������",0
Chair_item_name: db "����",0

Electronic_cell_name: db "����������� ���� ����������",0
Electronic_break_name: db "��������� �����������", 0

Grass_cell_name: db "�����", 0
Bush_cell_name: db "���������", 0
Gravel_cell_name: db "������", 0
Sand_cell_name: db "�����", 0
CraterSmall_cell_name: db "������� �� �����", 0
Toilet_cell_name: db "������",0
Sink_cell_name: db "��������",0
Table_cell_name: db "����", 0
Keramit_cell_name: db "�������", 0
Locker_cell_name: db "�������", 0
Safe_cell_name: db "����", 0

PDA_cell_name: db "����������� �������", 0
Book_cell_name: db "�����", 0

Canister_cell_name: db "������������", 0
Generator_cell_name: db "������������ ���������", 0

Memo_cell_name: db "�����������", 0
Anabiose_cell_name: db "���������� ������", 0
Analyzer_cell_name: db "����������", 0
Mentoscanner_cell_name: db "������������", 0
Medicbox_cell_name: db "��������� � ���. �������������", 0

tHeroName1 defb "�����",0
tHeroName2 defb "HOMO",0

Electronic_break_mess:
  db "� ��� ��� ��� ������� ������ ������...",0

Soft_wall_show_electronic:
  db "��� ������������ ������� ������������     "
  db "������ ����������..",0

no_way_mess:
  db "������ �� ����������..",0

Electronic_kick_mess:
  db "������� ���������� ���������!!",0

Electronic_kick_open_mess:
  db "������! ������� � ����� �����.",0

Door_kick_chair_mess:
  db "��������������. ����� ���� �� �����������.",0

Door_kick_shard_mess:
  db "�� ����� �� �������� �� ��������..",0

Door_not_open_mess:
  db "����� �� �����������..",0

Take_bed_mess:
  db "������� ���� ����������� � ���� � ��      "
  db "�����������.. ",0

Take_floor_mess:
  db "������ �� �����..",0

Take_trash_mess:
  db "� �������� �� ���� �������� ������ �����  "
  db "��������...",0

Take_chair_mess
  db "� �������� ����..",0

Wall_mess:
  db "� ������� ����� �� ������� ������������   "
  db "�����... ��������������.",0

Table_mess:
  db "� ������� �� �����. ������ �� ���������.  ",0

Sink_mess:
  db "� ������ �� ��������. ������ �� ���������.",0

Toilet_mess:
  db "� ������ �� �������. ������ �� ���������.",0

Break_shard_mess
  db "������ ����� �������� ���������� � �����..",0

Bush_mess:
  db "������ ���� ������ �� ����������..",0

Locker_mess:
  db "������� �� ��������..", 0

Safe_mess:
  db "���� ��������� �� ���� ������ ������..", 0

Keramit_mess:
  db "������� �� �������� ���� ������������..", 0

; Statis_on_mess
  ; db "� ����� �� ������ � ��� �������� �������   "
  ; db "���������� ������ ������-����...",0

Take_shard_mess
  db "� �������� ������ ������� ��������..",0

Shard_to_soft_wall_mess
  db "������ �������� � �������� ����� � ������ "
  db "������������ ������..",0

Soft_wall_clean
  db "� ������ ������� ������������ ������.",0

Computer_break_mess 
  db "���� � ����� ����������, �� ����� ������- "
  db "���� �������..",0

Computer_add_shard_mess 
  db "��� ���� ������� ���� � ��������� ���     "
  db "��������� ������..",0

Soft_wall_hit_mess:
  db "������ ������ ��������� ��������� ����..",0

Soft_wall_hit_item_mess:
  db "����������. ���� �������� ������ �������.",0

Computer_off_mess:
  db "� ��������� ������� ������ � ��������     "
  db "����������..", 0

Computer_off_hit_mess:
  db "���������..", 0
