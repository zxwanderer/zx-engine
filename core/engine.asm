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

  MACRO CallCode ptr
    defw zxengine.call_code_me
    defw ptr
  ENDM

  MACRO CallScript ptr
    defw zxengine.call_script_me
    defw ptr
  ENDM

  MACRO SkanKeyTable ptr
    defw zxengine.scan_keys_me
    defw ptr
  ENDM

  MACRO SetVar var, value
    defw zxengine.set_var_me
    defb var
    defb value
  ENDM

; для использования внутри ассемблера

; первые резервные переменные
act_var equ 0; // переменная 0 - действие
ret_var equ 1; // переменная 2 что возвратили из скрипта

  MACRO setVar var, val
    LD ( zxengine.varsTab + var ), val
  ENDM

	MACRO getVar perem, var
    LD perem, ( zxengine.varsTab + var )
  ENDM


  ; rSetVar var,value

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
  HALT
  RET

wait_me:
  LD B, (HL)
  INC HL
wait_me_loop:
  /* HALT */
  NOP
  DJNZ wait_me_loop
  JP process

scan_keys_me: ; ================ scan keys
	mLDE
	PUSH HL
	EX DE, HL
	call scanKeys; возвратились из scankeys, в DE - указатель на процедуру
	JR NZ, call_script_call; если флаг не 0 то клавиша есть
	POP HL
	JP process

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

ENDMODULE
