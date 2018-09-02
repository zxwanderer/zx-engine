MODULE cursor

; двигаем курсор
up:
  LD A, (Vars.cursor_pos_y)
  DEC A
  JP M, scr_up
  LD (Vars.cursor_pos_y),A
  RET

left:
  LD A, (Vars.cursor_pos_x)
  DEC A
  JP M, scr_left
  LD (Vars.cursor_pos_x),A
  RET

down:
  LD A, (Vars.cursor_pos_y)
  INC A
  CP scrHeight
  JP NC, scr_down
  LD (Vars.cursor_pos_y),A
  RET

right:
  LD A, (Vars.cursor_pos_x)
  INC A
  CP scrWidth
  JP NC, scr_right
  LD (Vars.cursor_pos_x),A
  RET

scr_up
scr_down
scr_left
scr_right
  RET
  
show_cursor:
    ; LD DE, #1008
    ; LD ( Vars.Cursor_pos ), DE
    LD DE, ( Vars.Cursor_pos ); нашли указатель курсора
    CALL math.pos_scr
    PUSH DE
    EX HL, DE

    DUP 2
    LD A, %11111111
    XOR (HL)
    LD (HL), A
    INC HL

    LD A, %11111111
    XOR (HL)
    LD (HL), A
    DEC HL
    INC H
    EDUP

    DUP 6
    LD A, %11000000
    XOR (HL)
    LD (HL), A
    INC HL
    
    LD A, %00000011
    XOR (HL)
    LD (HL), A
    DEC HL
    INC H
    EDUP

    POP DE
    CALL math.down_pos
    EX HL, DE

    DUP 6
    LD A, %11000000
    XOR (HL)
    LD (HL), A
    INC HL
    
    LD A, %00000011
    XOR (HL)
    LD (HL), A
    DEC HL
    INC H
    EDUP

    DUP 2
    LD A, #FF
    XOR (HL)
    LD (HL), A
    INC HL

    LD A, #FF
    XOR (HL)
    LD (HL), A
    DEC HL
    INC H
    EDUP

    RET

ENDMODULE