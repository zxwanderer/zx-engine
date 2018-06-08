DEVICE zxspectrum48

    ORG #4000

begin:
    incbin "game.bin.zx7"
end:

 DISPLAY "pack size: ", /D, end-begin
