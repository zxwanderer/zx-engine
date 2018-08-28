
ComputerBreak.spr equ #24

  MODULE ComputerBreak

_temp equ $; запоминаем адрес

    SETUP_CELL_TYPE Computer_cell_name, computer_break_script

  ORG _temp; восстанавливаем адрес
  
computer_break_script:
  shiruFX 56
  CallScript action_ring_explode
  SetMapCell Trash.spr
  ; CallCode binary_add_shard
  ShowText Computer_add_shard_mess
  goto no_way_script

; binary_add_shard:
  ; LD DE, (Vars.MapCell_xy); читаем где у нас подзорвалось
  ; INC E ; Y+1 ( размещаем shard внизу взорвавшегося предмета )
  ; LD A, Shard.item
  ; CALL items.add_item_to_map
  ; RET

  ENDMODULE
