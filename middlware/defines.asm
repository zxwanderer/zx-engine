;указатели направления

; dir_up   EQU 0
; dir_up_right EQU 1
; dir_right  EQU 2
; dir_down_right EQU 3

; dir_down EQU 4
; dir_down_left EQU 5
; dir_left  EQU 6
; dir_up_left EQU 7
; dir_center EQU 8; никуда не двигаем =)

dir_down EQU 0
dir_down_left EQU 1
dir_left  EQU 2
dir_up_left EQU 3
dir_up   EQU 4
dir_up_right EQU 5
dir_right  EQU 6
dir_down_right EQU 7
dir_center EQU 8; никуда не двигаем =)

; действия
do_end   EQU #00
do_stand EQU #01
do_get EQU #02
do_drop EQU #3
do_look  EQU #02
do_use   EQU #04
do_smach EQU #05

; вызываем действие с интерфейса, 
; код в Entities определяет берем ли мы предмет с карты (если руки свободны) 
; или бросаем ( если руки заняты а ячейка свободна :P )
; и вызывает скрипт либо с do_get либо с do_drop
do_get_drop  EQU #10