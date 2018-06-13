
Shard_Item: equ 0
Shard_spr: equ #34

    ; define Cell_Type_Shard Entities.CellType Shard_item_name,   shard_script ; 34
    ; define Shard_Item_Type items.ItemType Shard_spr, 0, 10

shard_script:
  IfVar Vars.var_act, do_get, take_shard_script
  defb _endByte
take_shard_script:
  ShowText Take_shard_mess
  defb _endByte

