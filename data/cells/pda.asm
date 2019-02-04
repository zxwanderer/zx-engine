
PdaWhite.spr: equ 104
  MODULE PdaWhite
    SETUP_CELL_TYPE_N PDA_cell_name, script

script:
  IfVarN Vars.var_act, do_get, Floor.script
  ScanPosTable scan_table
  goto no_way_script
  ENDMODULE

scan_table:
  defb 16,4
  defw show_alarm
  defb 30,18
  defw show_private_help
  defb 4,15
  defw show_genetic
  defb 10,10
  defw show_tesla
  defb _endByte

show_alarm:
  CallCode input.noKey
  CallCode binary_clear_screen
  setScreen PAPER_BLACK or PEN_CYAN
  printAt 0,0,ALARM_HELP
  CallCode binary_play_intro
  CallCode input.noKey
  defb _endByte

show_private_help:
  CallCode input.noKey
  CallCode binary_clear_screen
  setScreen PAPER_BLACK or PEN_CYAN
  printAt 0,0,PRIVATE_HELP
  CallCode binary_play_intro
  CallCode input.noKey
  defb _endByte

show_genetic:
  CallCode input.noKey
  CallCode binary_clear_screen
  setScreen PAPER_BLACK or PEN_CYAN
  printAt 0,0,GENETIC_HELP
  CallCode binary_play_intro
  CallCode input.noKey
  defb _endByte

show_tesla:
  CallCode input.noKey
  CallCode binary_clear_screen
  setScreen PAPER_BLACK or PEN_CYAN
  printAt 0,0,BIOTESLA_HELP
  CallCode binary_play_intro
  ; CallCode input.waitKey
  CallCode input.noKey
  defb _endByte

PdaBlue.spr: equ 106
  MODULE PdaBlue
    SETUP_CELL_TYPE_N PDA_cell_name, Floor.script
  ENDMODULE
