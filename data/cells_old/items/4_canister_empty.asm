CanisterEmpty.item: equ 4
CanisterEmpty.spr: equ 29

  MODULE CanisterEmpty

    SETUP_CELL_TYPE_N CanisterEmpty_cell_name, Canister.script
    SETUP_ITEM_TYPE_N

; SetIndexPointer do_drop, no_way_script ; нельзя поставить ничего на этот предмет
; явно не прописываем, так как в таблице ActionReaction действия do_drop нет
; поэтому потом по дефолту сработает следующая строчка после CheckActionReaction
; а там написано goto no_way_script

  ENDMODULE
