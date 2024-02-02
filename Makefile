sjasmplus_parts:
	./bin/sjasmplus --dos866 --nofakes --dirbol parts.asm

zx7: sjasmplus_parts
	rm -f *.zx7; ./bin/zx7 static.bin; ./bin/zx7 dynamic.bin

sjasmplus_one: zx7
	./bin/sjasmplus --dos866 --nofakes --dirbol one.asm

make_sna:
	./bin/sjasmplus --dos866 --nofakes --dirbol make_sna.asm

run_sna: make_sna
	open -a 'UnrealSpeccyPortable' cell3326.sna

make_trd: zx7
	./bin/sjasmplus --dos866 --nofakes --dirbol make_trd.asm

run_trd: make_trd
	open -a 'UnrealSpeccyPortable' cell3326.trd --args -m 0 

make_tape: sjasmplus_one
	./bin/bin2tap -b -hp cell3326.bin -c 24575 -a 24576 -r 24576 

run_tape: make_tape
	open -a 'UnrealSpeccyPortable' cell3326.tap --args -m 0 
