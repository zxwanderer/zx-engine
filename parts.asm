DEVICE zxspectrum128
; ORG #8000
ORG #5B00 ; уся память в наших руках c собственным IM 2!!!
; [code][static][dynamic]

include "main.asm"

  ; прикрепляем к engine скрипты и определения
  SAVEBIN "static.bin", code, dynamic-code
  SAVEBIN "dynamic.bin", dynamic, _all_end-dynamic
