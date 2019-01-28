MODULE zxengine

  MACRO stop
    defw zxengine.stop_me
  ENDM

  MACRO goto addr
    defw zxengine.goto_me
    defw addr
  ENDM

  MACRO wait num
    defw zxengine.wait_me
    defb num
  ENDM

  MACRO wait_halt num
    defw zxengine.halt_me
    defb num
  ENDM

  MACRO CallCode ptr
    defw zxengine.call_code_me
    defw ptr
  ENDM

  MACRO CallScript ptr
    defw zxengine.call_script_me
    defw ptr
  ENDM

; сканировать таблицу в зависимости от нажатой клавиши
  MACRO ScanKeyTable ptr
    defw zxengine.scan_keys_me
    defw ptr
  ENDM

; сканировать таблицу в зависимости от нажатой клавиши
  MACRO ScanPosTable ptr
    defw zxengine.scan_pos_table_me
    defw ptr
  ENDM

; сканировать таблицу в зависимости от номера переменной ( не значения!!! )
  MACRO SkanVarTable var_num, ptr
    defw zxengine.scan_var_me
    defw ptr
    defw var_num
  ENDM

  MACRO SetVar var, value
    defw zxengine.set_var_me
    defb var
    defb value
  ENDM

	MACRO IfVar var_num, value_, code_ptr; переход 
	  defw zxengine.if_var_me
	  defb var_num
	  defb value_
	  defw code_ptr
	ENDM

  MACRO IfVarN var_num, value_, code_ptr; переход
	  defw zxengine.if_var_not_me
	  defb var_num
	  defb value_
	  defw code_ptr
	ENDM

  MACRO IncVar var_num
	  defw zxengine.inc_var_me
    defb var_num
  ENDM

; для использования внутри ассемблера

  MACRO setVar var; заносим значение из A в переменную движка
    LD ( zxengine.varsTab + var ), A
  ENDM

	MACRO getVar var; в A заносим значение переменной движка
    LD A, ( zxengine.varsTab + var )
  ENDM

cur_addr equ $

; org #f000

; различные переменные для скриптов
varsTab:
  DUP 256
    defb 00
  EDUP

; наш внутренний стек 
my_stack:
  DEFS 100, 00
my_stack_end:

; org cur_addr

init:
  DI

  LD HL,pack_dynamic
  LD DE, dynamic
  CALL dzx7_standard

  CALL clearVars

  LD SP, my_stack_end
  CALL interrupt.init

start:
  EI
  LD HL, START_SCRIPT
process:
  LD A, (HL)
  AND A; _endByte -> 0
  RET Z
  LD E,A
  INC HL
  LD D,(HL)
  INC HL
  LD (process_goto+1), DE
process_goto:
  JP #0000 // в DE - указатель на данные

clear_data:
  LD HL,pack_dynamic
  LD DE, dynamic
  CALL dzx7_standard
  CALL clearVars
  RET

call_code_me:
  mLDE
  PUSH HL
  EX HL,DE
  CALL callHL
  POP HL
  JP process

callHL  JP (hl)

goto_me:
  ; LD DE, (HL)
  mLDE
  EX HL, DE
  JP process

halt_me:
  mLDB
wait_halt_loop:
  HALT
  DJNZ wait_halt_loop
  JP process

wait_me:
  LD B, (HL)
  INC HL
wait_me_loop:
  NOP
  DJNZ wait_me_loop
  JP process

; scan_var_me:
; 	mLDE; table_ptr
;   mLDA; A - var num
;   PUSH HL; script_pointer

;   PUSH DE
  
;   call getVar ; A - значение var
;   LD B,A
  
;   POP HL
;   call scan_sctipt_table
;   JR NZ, call_script_call; если флаг не 0 то переменная найдена
;   POP HL
;   JP process

scan_pos_table_me: ; ================ сканируем позицию 
	mLDE
	PUSH HL
  LD HL,Vars.MapCell_xy
  LD B,(HL)
  INC HL 
  LD C,(HL)
  EX DE, HL
  CALL scan_table_xy; в HL адрес
  LD E, (HL)
  INC HL
  LD D, (HL)
  ; LD DE, (HL)
	; EX DE, HL
  JP NZ, call_script_call; если флаг не 0 то есть координаты
  POP HL
	JP process

scan_keys_me: ; ================ scan keys
	mLDE
	PUSH HL
	EX DE, HL
	call scanKeys; возвратились из scankeys, в DE - указатель на процедуру
	JP NZ, call_script_call; если флаг не 0 то клавиша есть
	POP HL
	JP process

; вход:
;   в B - значение переменной
;   в HL указатель на таблицу вида [ptr],[value]
; выход:
; z=1 если найдено, в DE указатель на скрипт
; scan_sctipt_table:
;   LD A,(HL) ;//  загружаем первый байт
;   AND A
;   RET Z ; возвращаем если конец таблицы
;   LD E,A
;   INC HL
;   LD D,(HL)
;   INC HL
;   LD A,(HL) ;//  загружаем value
;   INC HL
;   CP B
;   JR NZ,scan_sctipt_table
; 	OR 2
; 	RET

; вход:
;   в B,C - значения переменной
;   в HL указатель на таблицу вида [value_b][value_c][ptr]
; выход:
; Z=1 если найдено, в HL указатель на скрипт
scan_table_xy:
  LD A,(HL) ;//  загружаем первый байт
  AND A
  RET Z
  LD E,A
  INC HL
  LD A,(HL)
  INC HL
  CP B
  JP NZ, scan_table_xy_next
  LD A,E
  CP C
  JP NZ, scan_table_xy_next
  OR 2
  RET
scan_table_xy_next:
  INC HL
  INC HL
  JP scan_table_xy
  ; LD E,A
  ; INC HL
  ; LD D,(HL)
  ; INC HL
  ; LD A,(HL) ;//  загружаем value
  ; INC HL
  ; CP B
	; RET

	; честно стырено из движка Wanderers
scanKeys:
	ld a,(HL) ;//  загружаем первый байт
	and a  ;проверяем на 0
	ret z ; возвращаем если 0
	inc hl ; увеличиваем HL
	in a,(0xfe) ; читаем значение
	and (hl) ; сравниваем со вторым байтом
	inc hl   ; увеличиваем указатель
	ld e,(hl)
	inc hl
	ld d,(hl) ; запоминаем в DE указатель на процедуру
	inc hl    ; увеличиваем HL
	jr nz,scanKeys
	or 2
	ret

call_script_me:
  mLDE
	PUSH HL
call_script_call:
	EX DE, HL
	CALL process
call_script_ret:
	POP HL
	JP process

; rIfVar var_num,value,code_ptr
if_var_me:
	mLDA
	CALL getVar
	CP (HL)
	INC HL
	JP Z, goto_me; переход по GOTO
if_var_me_no_goto:
	INC HL
	INC HL
	JP process

; rIfVar var_num,value,code_ptr
if_var_not_me
	mLDA
	CALL getVar
	CP (HL)
	INC HL
	JP NZ, goto_me; переход по GOTO
	JP if_var_me_no_goto

set_var_me:
	mLDA
	CALL getVar
	LD A,(HL)
	INC HL
	LD (DE),A
	JP process

inc_var_me:
	mLDA
	CALL getVar
	LD A, (DE)
  INC A
  LD (DE),A
	JP process

; --- получить значение переменной
; на входе A - номер переменной
; на выходе 
;   в DE - указатель на переменную
;   в A - значение переменной
getVar:
	ld de,varsTab
	mADDA D,E
	ld A,(DE)
	ret

; --- обнулить массив переменных
clearVars:
  LD HL, varsTab
  LD A, 0
  LD B, 255
  JP math.memset

frames_cnt: dw 0000;
frames_measured: dw 0000;

start_measure:
  LD HL, (interrupt.frame_counter)
  LD (frames_cnt), HL
  RET

stop_measure:
  LD HL, (interrupt.frame_counter)
  LD DE, (frames_cnt)
  XOR A
  SBC HL, DE
  LD (frames_measured), HL
  RET

ENDMODULE

; display "zxengine.scan_table_xy", zxengine.scan_table_xy