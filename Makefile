BUILD_FOLDER := ./output

.PHONY: *

all:	make_tape make_trd make_sna

source:
	source ./venv/bin/activate

clean:
	rm -rf $(BUILD_FOLDER)
	mkdir -p $(BUILD_FOLDER)

make_qr_png:
	./bin/zx-qr-code --url https://zxwanderer.github.io/cell3326/1.2.1-aplha -o ./qrcode.png

make_qr:
	./bin/zx-qr-code --url https://zxwanderer.github.io/cell3326/1.2.1-aplha -o ./qrcode.bin

make_scr:
	python3 ./bin/png2scr.py -i ./data/maps/tiles.png -o $(BUILD_FOLDER)/tiles.scr

make_tileset: make_scr
	python3 ./bin/scr2spr.py --width 2 --height 2 --color True --count 191 -i $(BUILD_FOLDER)/tiles.scr -o $(BUILD_FOLDER)/tiles.bin

make_map:
	python3 ./bin/tiled2bin.py -i ./data/maps/map.tmx -o $(BUILD_FOLDER)/map.bin

parts: clean make_tileset make_map
	./bin/sjasmplus --dos866 --nofakes \
		-i$(BUILD_FOLDER) \
		--outprefix=$(BUILD_FOLDER)/ \
		--dirbol parts.asm

zx7: parts
	./bin/zx7 $(BUILD_FOLDER)/static.bin;
	./bin/zx7 $(BUILD_FOLDER)/dynamic.bin

sjasmplus_one: zx7
	./bin/sjasmplus --dos866 --nofakes \
	-i$(BUILD_FOLDER) \
	--outprefix=$(BUILD_FOLDER)/ \
	--dirbol one.asm

make_sna: zx7
	./bin/sjasmplus --dos866 --nofakes \
		-i$(BUILD_FOLDER) \
		--outprefix=$(BUILD_FOLDER)/ \
		--dirbol make_sna.asm

run_sna: make_sna
	open -a 'UnrealSpeccyPortable' $(BUILD_FOLDER)/cell3326.sna

make_trd: zx7
	./bin/sjasmplus --dos866 --nofakes \
		-i$(BUILD_FOLDER) \
		--outprefix=$(BUILD_FOLDER)/ \
		--dirbol make_trd.asm

run_trd: make_trd
	open -a 'UnrealSpeccyPortable' $(BUILD_FOLDER)/cell3326.trd --args -m 0 

make_tape: sjasmplus_one
	./bin/bin2tap -b -hp $(BUILD_FOLDER)/cell3326.bin -c 24575 -a 24576 -r 24576 

run_tape: make_tape
	open -a 'UnrealSpeccyPortable' $(BUILD_FOLDER)/cell3326.tap

debug: make_sna
	open -a 'xpeccy' $(BUILD_FOLDER)/cell3326.sna --args --labels $(BUILD_FOLDER)/cell3326.list
