;  Windows-1251 encoded only !!!!

HELLO_TXT:
  ; db "012345678901234567890123456789012345678901"

  db "������ ���!!!! ������ ���! ��� ���������  "
  db "���� �� ������ zx-engine, �������         "
  db "���������� �������. �� ����� ���� ������� "
  db "������ ��� �� ������� � �� �����, ���     "
  db "������� �����������. ��� ��� ���������� � "
  db "����. �� �������� ��������� �������, ���  "
  db "����� ��������� � ����������� ���� HL.    "
  db "����� ������������ �������� ���� ���������"
  db "��� ������ ����������� ���. ����������    "
  db "��������� ������ ���������, ������������  "
  db "�������� � ���������������, � �����       "
  db "����������� � ���� ������������ ���       "
  db "�������. "
  db _endByte

CELL_TYPE_NAMES:
Empty_cell_name: db "�����",0
Floor_cell_name: db "������",0
Computer_cell_name: db "��������",0
Door_cell_name: db "�����",0
Wall_cell_name: db "�����",0
Ballon_cell_name: db "������",0

Soft_wall_name: db "�����",0

Shard_item_name: db "�������",0
Chair_item_name: db "����",0


tHeroName1 defb "�����",0
tHeroName2 defb "HOMO",0

Take_chair_mess defb "� �������� ����",0
Computer_break_mess 
  db "����� ���������� ������� � ��������!      "
  db "[�������? ���������� ������� � 3000 ����?]"
  db _endByte