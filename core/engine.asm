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
  MACRO SkanKeyTable ptr
    defw zxengine.scan_keys_me
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

; для использования внутри ассемблера

; первые резервные переменные
var_act equ 0; // переменная 0 - действие
var_ret equ 1; // переменная 1 - что возвратили из скрипта
var_item_id equ 2; // переменная 3 - чем воздействуем
; map_cell_x equ 2; //
; map_cell_y equ 3; // 

  MACRO setVar var, val
    LD ( zxengine.varsTab + var ), val
  ENDM

	MACRO getVar perem, var
    LD perem, ( zxengine.varsTab + var )
  ENDM

; различные переменные для скриптов
varsTab:
  DUP 256
    defb 00
  EDUP

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

call_code_me:
  mLDE
  PUSH HL
  EX HL,DE
  CALL callHL
  POP HL
  JP process

callHL  JP (hl)

goto_me:
  LD DE, (HL)
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
  /* HALT */
  NOP
  DJNZ wait_me_loop
  JP process

scan_var_me:
	mLDE; table_ptr
  mLDA; A - var num
  PUSH HL; script_pointer

  PUSH DE
  
  call getVar ; A - значение var
  LD B,A
  
  POP HL
  call scan_sctipt_table
  JR NZ, call_script_call; если флаг не 0 то переменная найдена
  POP HL
  JP process

scan_keys_me: ; ================ scan keys
	mLDE
	PUSH HL
	EX DE, HL
	call scanKeys; возвратились из scankeys, в DE - указатель на процедуру
	JR NZ, call_script_call; если флаг не 0 то клавиша есть
	POP HL
	JP process

; вход:
;   в B - значение переменной
;   в HL указатель на таблицу вида [ptr],[value]
; выход:
; z=1 если найдено, в DE указатель на скрипт
scan_sctipt_table:
  LD A,(HL) ;//  загружаем первый байт
  AND A
  RET Z ; возвращаем если конец таблицы
  LD E,A
  INC HL
  LD D,(HL)
  INC HL
  LD A,(HL) ;//  загружаем value
  INC HL
  CP B
  JR NZ,scan_sctipt_table
	OR 2
	RET

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

set_var_me:
	mLDA
	CALL getVar
	LD A,(HL)
	INC HL
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

; ищем
find_action_ect:

ENDMODULE
