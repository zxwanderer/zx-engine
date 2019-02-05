;  Windows-1251 encoded only !!!!

HELLO_TXT:
; db "012345678901234567890123456789012345678901"
  db " CELL 3326       v1.0-alpha    05.02.2019 "
  db "------------------------------------------"
  db "������ ���! � ���� �������� � ����� � ����"
  db "����. ����� ������� - �����, ����������   "
  db "������, ����������� �� ������� � �������. "
  ; db "------------------------------------------"
  db "                                          "
  db "-----------[���������� � ����]------------"
  db "                                          "
  ; db "���������� � ����:                        "
  db "������ �������,QAOP-������������          "
  db "                                          "
  db "Enter,Space,M-�������� ����� �������      "
  db "                                          "
  db "G-����� � ����                            "
  db "                                          "
  db "------------------------------------------"
  db "��� Wanderer, ������ AER                  "
  db "����: zxwanderer.github.io/cell3326       "
  db "------------------------------------------"
  db _endByte

; ABOUT_TXT:
;   db "------------------------------------------"
;   db " [I]nfo                                   "
;   db "------------------------------------------"
;   db "��������� ���� �� ���������� ���� �����   "
;   db "�� ���������� ��� �� SamStyle � SancheZ.  "
;   db "------------------------------------------"
;   db "������� �������� �������������� �� ���    "
;   db "RebelStar,LaserSquad,Monstrland,Stalker.. "
;   db "------------------------------------------"
;   db "��� ���������� ���� ������������:         "
;   db " -���������� ���������� Z80 sjasmplus     "
;   db " -�������� ������ beepFX �� Shiru         "
;   db " -��������� �������� Visual Studio Code   "
;   db " -�������� �������� ���� Tiled            "
;   db " -����������� ���������� �������� Aseprite"
;   db " -����������� �������� ZX-Paintbrush      "
;   db " -�������� Speccy Unreal Portable         "
;   db " -��������� zx7                           "
;   db " -������� bin2tap, mctrd                  "
;   db _endByte

; HELP:
;   db "------------------------------------------"
;   db " [H]elp                                   "
;   db "------------------------------------------"
;   db "                                          "
;   db "[������ �������], [QAOP] - ������������   "
;   db "                                          "
;   db "[Enter],[Space] - ������ �������� �� ���- "
;   db "�� ����� ����� ���������� ��� ���������,  "
;   db "������� ��������� � �����. ���� ���� �����"
;   db "� ����� ���������� ��������� �������, ��  "
;   db "������� ��� � ����.                       "
;   db "                                          "
;   db "G - ����� �� ���� � ����                  "
;   db _endByte

GAMEOVER_1:
  db "------------------------------------------"
  db " ����� ����                               "
  db "------------------------------------------"
  db "� �� ���� ���� ������ �� ������ ������-   "
  db "����. �� ��������� � ������������� �����- "
  db "���, ������� ��� ���� ������� ���������   "
  db "�������� � �������� �������..             "
  db "------------------------------------------"
  db "����� �����, ��� �� ����������."
  db _endByte

GAMEOVER_2: ; ����� ��� ��������� � � �������� ������
  db "------------------------------------------"
  db " ����� ����                               "
  db "------------------------------------------"
  db "������� ����� ����� ��������� � ��������� "
  db "������ ������ ����������� ������. ����    "
  db "��������� ������ ��������������� ������,  "
  db "�������� �� ���� ������ � �������         "
  db "� ���������� � ���������,����� ��������   "
  db "��������� �������� ��������..             "
  db "------------------------------------------"
  db "����� �����, ��� �� ����������."
  db _endByte

GAMEOVER_3: ; ����� ����������
  db "------------------------------------------"
  db " ����� ����                               "
  db "------------------------------------------"
  db "� ���� ���� ������� ���������� ���������  "
  db "� ����� ��������� ������ ��� ������������ "
  db "� �������� ����������� ����..             "
  db "------------------------------------------"
  db "������ ��� � ��� �� ���������� ��������   "
  db "������������ �������, �� ������� ������   "
  db "����������� ������ ���� � ������� ������  "
  db "���������� � ������� � �����. �������,    "
  db "����� �� ��������� �� ����� ������ �      "
  db "��������� � ��� ���������..               "
  db "------------------------------------------"
  db "�� ������ ����.. ��������.."
  db _endByte

GAMEOVER_3_1:
  db "7� ����� ������������                     "
  db "���������� ��������                       "
  db "16.11.3326                                "
  db "����: \"���������� ���\"                    "
  db "                                          "
  db "       \"������\" - \"�������\"               "
  db "                                          "
  db "��� ������� ������� N1 '������' ��� ����, "
  db "� ������� '�������' ���������� � �����    "
  db "����������. ������ ���� ��-153 (������    "
  db "���� ������) ����������� ��� �������      "
  db "���������� ������������ �� ����������     "
  db "������� �����������, �������� � ��������- "
  db "��� ����� � ������ ����������.            "
  db "����������� ��������, ���� �������� �����-"
  db "��� ����������.                           "
  db "                                          "
  db "   12.10               \"������\"           "
  db _endByte

; GAMEOVER_4_0:
;   db "7� ����� ������������                     "
;   db "���������� ��������                       "
;   db "�����������!                              "
;   db "15.11.3326                                "
;   db "����: \"���������� ���\"                    "
;   db "                                          "
;   db "       \"������\" - \"�������\"               "
;   db "                                          "
;   db "������� � 3.08 ��������� ���������������� "
;   db "�������������� ������������ � �������� N1,"
;   db "������� ��������� ����� ��� ��������������"
;   db "������� � ������� ��������� ������� 432-B."
;   db "������� ���������� ����������.            "
;   db "                                          "
;   db "   23.54               \"������\"           "
;   db _endByte

GAMEOVER_4: ; ���� �����
  db "------------------------------------------"
  db " ����� ����                               "
  db "------------------------------------------"
  db "��������� ������� �� ��������� ���������, "
  db "������� � �� ���� �������� �������������  "
  db "�������, � ������� ������������� ����     "
  db "����� �����. ��������� �� �� ����������.. "
  db "------------------------------------------"
  db "�� ������ ����! ���-���-���!              "
  db _endByte

GAMEOVER_5: ; ����� ��� ��������� � � �������� ������
  db "------------------------------------------"
  db " ����� ����                               "
  db "------------------------------------------"
  db "��� ������� ������ � ��������� ���������  "
  db "������� �������������� � �������..        "
  db "------------------------------------------"
  db "����� �����, ��� �� ����������."
  db _endByte

PRIVATE_HELP:
  db "��������� ������������. ��������.         "
  db "------------------------------------------"
  db "                                          "
  db "..��-�������� ���������� �� ������� MURK �"
  db "������� �� ���������� ������� � ����������"
  db "� ������ ��������� � ������� N1..         "
  db "                                          "
  db "..������������ ��� ���������� 'Z-���������"
  db "����������' �������� ���..                "
  db "                                          "
  db "..����������� ����� ����� ���� ��������-  "
  db "���� � �������� ������� ��� �����������.. "
  db _endByte

ALARM_HELP:
  db "������ ���������� ���������               "
  db "------------------------------------------"
  db "                                          "
  db "..������� ���� ������������ ����-������,  "
  db "����� ������� ������� � ���������� ������,"
  db "������ ���� ������� �� ��������� � ������-"
  db "�� ���������.."
  db _endByte

GENETIC_HELP:
  db "..Z-������� ������ ���� ������, ��������- "
  db "������� ������������ ������� ������������ "
  db "��� � ����� ������� ���������������� ����-"
  db "���..                                     "
  db _endByte

BIOTESLA_HELP:
  db "��������� � ������������ �����������      "
  db "------------------------------------------"
  db "..���������� ������������ ����� �������� �"
  db "������������ ������ ������ ��� ���������  "
  db "������������� �� ���������� ������������.."
  db "                                          "
  db "..��� ������� ����� ������������ �������  "
  db "���������� �� ����� 6 �������������..     "
  db "                                          "
  db "..������������ ����� ���������� ��� �����-"
  db "������� ��� � �������� ����������. �����  "
  db "��������� �������� ������� ���������� ��  "
  db "���������� �������� ����� ��� ��������    "
  db "������ ��� ����� ����� ������-�������     "
  db "�������������..                           "
  db _endByte

GAMEOVER_4_0:
  db "7� ����� ������������                     "
  db "���������� ��������                       "
  db "16.11.3326                                "
  db "����: \"���������� ���\"                    "
  db "                                          "
  db "       \"������\" - \"�������\"               "
  db "                                          "
  db "..������ ������� '�������' ������, �������"
  db "���������� � ����� ���������� ���������,  "
  db "'������' ����, ������������ ������� N1    "
  db "�����..                                   "
  db "                                          "
  db " ..����� ��-12,��-115,��-123 ����� ������-"
  db "���� �� ��������������� ��������� '�����- "
  db "��', ��-118 ��������� ���������� �������  "
  db "'�������'..                               "                 
  db "                                          "
  db " ..���� ��-153 �������� ���������������   "
  db "������� ��������� ������������ ������ ��  "
  db "��������� ������������ ������ �������,    " 
  db "������ � ������ '�������' � ������� �     "
  db "�������� � ������� ���������,�������      "
  db "�����..           "
 
  ; ������� ����
  ; ������� ����
  ; ������� �����  
  ; ������ ������
  
  db _endByte

CALL_HELP_NO_CODE:
  db "��� ��� ��������� ��������, �� � �� ����  "
  db "���� ������� ��������� ���������.."
  db _endByte

NO_WAY_SCAF:
  db "� �� ������� �������� � ������ ���������  "
  db "������� ������ �� ����.."
  db _endByte

SHOW_SIREN:
  db "���������� ����������������� ������ � ��  "
  db "���� ���� ����������� �������������.."
  db _endByte

FOUND_ALERT_CODE:
  db "���� ��������. � ���� ������� � ��������  "
  db "� ��� ��� ������� ���������� ���������.."
  db _endByte

CELL_TYPE_NAMES:
Empty_cell_name: db " ",0
Floor_cell_name: db "������",0
Computer_cell_name: db "��������",0
Door_cell_name: db "�����",0
DoorHard_cell_name: db "�������� �����",0
Wall_cell_name: db "������� ����������",0
; Ballon_cell_name: db "������",0
Bed_cell_name: db "�������",0
Trash_cell_name: db "������ ������� � �����",0

Soft_wall_name: db "������ ������������ �����",0

Shard_item_name: db "������ ����������� �������",0
Chair_item_name: db "����",0

; ���������
player_name1: db "������ ������ � ��������: \"������� ����\"", 0
; ������
player_name2: db "������ ������ � ��������: \"������� ����\"", 0
; ������ 
player_name3: db "������ ������ � ��������: \"������� �����\"", 0
; ������
player_name4: db "������ ������ � ��������: \"���� ������\"", 0
; ������
player_name5: db "������ ������ � ��������: \"������ ������\"", 0

Electronic_cell_name: db "����������� ���� ����������",0
Electronic_break_name: db "��������� �����������", 0

Grass_cell_name: db "�����", 0
Bush_cell_name: db "���������", 0
PlantPot_cell_name: db "�������� � ������", 0
Gravel_cell_name: db "������", 0
Sand_cell_name: db "�����", 0
CraterSmall_cell_name: db "������� �� �����", 0
AirLand_cell_name: db "���������� ��������", 0
NavLight_cell_name: db "������������� ����", 0
Acid_cell_name: db "������ ���������� ����", 0

; Toilet_cell_name: db "������",0
; Sink_cell_name: db "��������",0
Table_cell_name: db "����", 0
Keramit_cell_name: db "�������", 0
; Locker_cell_name: db "�������", 0
Safe_cell_name: db "����", 0
Safe_try_hit_mess:
  db "�� ����� ���� ������� �� ��������...", 0


PDA_cell_name: db "����������� �������", 0
Book_cell_name: db "�����", 0

RedCard_cell_name: db "����-����� �� ����� ���������� ", 0

Canister_cell_name: db "������������", 0
CanisterEmpty_cell_name: db "������ ������������", 0
CanisterPowered_cell_name: db "�������� ������������", 0
Generator_cell_name: db "������������ �������", 0

WallHole_name: db "������� ���� � �����",0
WallGrid_name: db "������������� �������", 0
WallCavity_name: db "����� ��� �����������", 0

Body_no_get: 
  db "��� �� ������� ������� ������� ����..", 0

Body_cell_name:
  db "���� ��������, ���� �� ���������������    "
  db "������", 0

BodyTech_cell_name:
  db "���� �������� � ������ �������, �������   "
  db "����������� ���", 0

BodyInScaf_cell_name:
  db "���� �������� � ���������, �������� ������"
  db "�������������� ������� � ����������." , 0

; Memo_cell_name: db "�����������", 0
Anabiose_cell_name: db "���������� ������", 0
Analyzer_cell_name: db "����������", 0
Mentoscanner_cell_name: db "������������", 0
; Medicbox_cell_name: db "��������� � ���. �������������", 0
; FoodDispenser_cell_name: db "������� ���������", 0
ElectonicDestroy_cell_name: db "������� ������������..", 0

Nippers_item_name: db "�������������� �������������� �������", 0
Wrench_cell_name: db "������� ����-���", 0

ScafPlace_cell_name: db "������ ��� ���������", 0
Scaf_cell_name: db "������ ��������", 0
HardScaf_cell_name: db "������� ������ ��������", 0

Nipple_cell_name: db "�������� ��� �������������", 0

; Pistol_cell_name: db "�������� �������������� ��������",0

; Mentoscanner_kick_mess:
  ; db "�� �������� ����� ������� ������ ��������...",0

; tHeroName1 defb "�����",0
tHeroName2 defb " ",0

WallGrid_false_mess:
  db "������� ������ ������� �� �����������..",0

Soft_wall_show_electronic:
  db "��� ������������ ������� ������������     "
  db "������ ����������..",0

Not_away_from_base: 
  db "� �� ������� ������� � ��������� �������  "
  db "����� ���� � ������ ���������..",0

Electronic_kick_mess:
  db "������� ���������� ���������!!",0

Electronic_kick_open_mess:
  db "������! ������� � ����� �����.",0

Kick_fault_mess:
  db "��������������. ������ �� ���������..",0

Kick_shard_mess:
  db "���� �������� �� ��������..",0

Door_not_open_mess:
  db "����� �� �����������..",0

Take_bed_mess:
  db "������� ���� ����������� � ���� � ��      "
  db "�����������.. ",0

; Take_floor_mess:
  ; db "��� ������ �� ����...",0

Take_trash_mess:
  db "� �������� �� ���� �������� ������ �����  "
  db "��������..",0

; Take_chair_mess
;   db "� �������� ����..",0

; Wall_mess:
;   db "� ������� ����� �� ������� ������������   "
;   db "�����... ��������������.",0

; Table_mess:
;   db "� ������� �� �����. ������ �� ���������.  ",0

; Sink_mess:
;   db "� ������ �� ��������. ������ �� ���������.",0

; Toilet_mess:
;   db "� ������ �� �������. ������ �� ���������.",0

; Break_shard_mess
  ; db "������ ����� �������� ���������� � �����..",0

; Bush_mess:
;   db "������ ���� ������ �� ����������..",0

; Locker_mess:
;   db "������� �� ��������..", 0

; Safe_mess:
;   db "���� ��������� �� ���� ������ ������..", 0

; Keramit_mess:
  ; db "������� �� �������� ���� ������������..", 0

; Statis_on_mess
  ; db "� ����� �� ������ � ��� �������� �������   "
  ; db "���������� ������ ������-����...",0

; Take_shard_mess
  ; db "� �������� ������ ������� ��������..",0

Shard_to_soft_wall_mess
  db "� �������� ����� � ������ ������������    "
  db "������..",0

; Soft_wall_clean
  ; db "� ������ ������� ������������ ������.",0

Computer_break_chair_mess:
  db "���� � ����� ����������, �� ����� �������.",0

Computer_break_mess:
  db "����� ���������� �������..",0

Computer_add_shard_mess 
  db "��� ���� ������� ���� � �������� ���      "
  db "��������� ������..",0

Soft_wall_hit_mess:
  db "���� �������� ������ �������.",0

Computer_off_mess:
  db "�������� ��� ���������.� ��������� �������"
  db "������ � �� ����������..", 0

Computer_off_hit_mess:
  db "���������..", 0
