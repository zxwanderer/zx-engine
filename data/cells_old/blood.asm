Blood.spr: equ 97
  MODULE Blood
    SETUP_CELL_TYPE_N Blood_cell_name, script

script: 
    IfVar Vars.var_act, do_drop, drop_
    goto Floor.script

drop_:
  IfVar Vars.var_item_id, CanisterEmpty.spr, fill_
  IfVar Vars.var_item_id, Canister.spr, canister_full_
  IfVar Vars.var_item_id, CanisterRed.spr, canister_full_
  goto need_look_no_way

canister_full_:
  ShowText Canister_full
  shiruFX FX_Nope
  goto no_way_script

fill_:
  CallCode binary_fill
  shiruFX FX_Pickup
  SetMapCell CraterSmall.spr ; на земле ставим маленький кратер
  ShowText Canister_fill
  goto no_way_script

binary_fill:
  CALL items.del_item_from_hand ; убираем пустую канистру
  LD A, CanisterRed.item
  CALL items.add_item_to_hand
  RET

  ENDMODULE
