
WallGrid.spr: equ 44

  MODULE WallGrid
    SETUP_CELL_TYPE_N WallGrid_name,     wallgrid_script

wallgrid_script:
;   IfVar Vars.var_act, do_get, get_script
;   IfVar Vars.var_act, do_drop, drop_script
  goto no_way_script

; drop_script:
;   IfVar Vars.var_item_id, Shard.spr, break_shard

; get_script:
;   shiruFX FX_Wall
;   CallScript action_ring_explode
;   ShowText Wall_mess
;   goto no_way_script

  ENDMODULE
