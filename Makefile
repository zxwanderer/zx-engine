all:	make_tape make_trd make_sna

make_scr:
	python3 ./bin/png2scr.py -i ./data/maps/tiles_many.png -o tiles.scr

make_tileset: make_scr
	python3 ./bin/scr2spr.py --width 2 --height 2 --color True --count 191 -i ./tiles.scr -o ./tiles.bin

make_map:
	python3 ./bin/tiled2bin.py -i ./data/maps/laboratory3.tmx -o map.bin

sjasmplus_parts: make_tileset make_map
	./bin/sjasmplus --dos866 --nofakes --dirbol parts.asm

zx7: sjasmplus_parts
	rm -f *.zx7; ./bin/zx7 static.bin; ./bin/zx7 dynamic.bin

sjasmplus_one: zx7
	./bin/sjasmplus --dos866 --nofakes --dirbol one.asm

make_sna: zx7
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
	open -a 'UnrealSpeccyPortable' --args cell3326.tap --args -m 0 

debug: make_sna
	open -a 'xpeccy' cell3326.sna --args --labels ./cell3326.list
