CanisterEmpty.item: equ 4
CanisterEmpty.spr: equ 29

  MODULE CanisterEmpty

    SETUP_CELL_TYPE_N CanisterEmpty_cell_name, script
    SETUP_ITEM_TYPE_N

script:
  CheckActionReaction _canister_empty_action_table
  goto no_way_script

; SetIndexPointer do_drop, no_way_script ; нельзя поставить ничего на этот предмет
; явно не прописываем, так как в таблице ActionReaction действия do_drop нет
; поэтому потом по дефолту сработает следующая строчка после CheckActionReaction
; а там написано goto no_way_script

_canister_empty_action_table:
  SetIndexPointer do_get, no_script ; можно взять
  defb _endByte

  ENDMODULE
