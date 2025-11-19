;  Windows-1251 encoded only !!!!

HELLO_TXT:
; db "012345678901234567890123456789012345678901"
  db " CELL 3326       v1.2.3        22.03.2024 "
  db "------------------------------------------"
  db "Hello world! I want to play a game with you."
  db "The plot is banal - a hero who lost", 13
  db "his memory wakes up on a bed in a room.", 13
  db "------------------------------------------", 13, 13
  db "Controls:", 13, 13
  db "Movement: Cursor keys, QAOP", 13
  db "Action: Enter, Space, M",13
  db "Exit to menu: G", 13, 13, 13, 13, 13
  db "------------------------------------------"
  db "Code by Wanderer, music by AER, graphics", 13
  db "from LaserSquad, Stalker, Monstrland", 13
  db "------------------------------------------"
  db "Website: zxwanderer.github.io/cell3326", 13
  db "------------------------------------------"
  db _endByte

GAMEOVER_1:
  db "------------------------------------------"
  db " Game Over", 13
  db "------------------------------------------"
  db "I hit the computer screen with all my", 13
  db "might. It exploded with a deafening roar,", 13
  db "piercing my body with sharp shards of", 13
  db "plastic and hot metal..", 13
  db "------------------------------------------"
  db "The hero died, that's how it turned out.", 13, 13
  db "Press G to return to menu"
  db _endByte

GAMEOVER_2: ; exit without spacesuit and with closed door
  db "------------------------------------------"
  db " Game Over", 13
  db "------------------------------------------"
  db "The outer airlock door opened, and the",13
  db "atmosphere of the living module rushed",13
  db "out. I was thrown by a powerful",13
  db "decompression shock, hit the corner of",13
  db "the building, and finally collided with",13
  db "a plant whose branches were quite hard..",13
  db "------------------------------------------"
  db "The hero died, that's how it turned out.", 13, 13
  db "Press G to return to menu"
  db _endByte

GAMEOVER_3: ; call for evacuation
  db "------------------------------------------"
  db " Game Over", 13
  db "------------------------------------------"
  db "I entered the emergency protocol codes", 13
  db "and within seconds was talking to the", 13
  db "orbital base duty officer..", 13
  db "------------------------------------------"
  db "An hour passed, and a capsule landed on", 13
  db "the landing pad, from which grim people", 13
  db "in heavy combat spacesuits and armed", 13
  db "started unloading. Strange, rescuers", 13
  db "don't usually carry weapons..", 13
  db "------------------------------------------"
  db "You finished the game.. probably..", 13, 13
  db "Press G to continue"
  db _endByte

GAMEOVER_3_1:
  db "7TH SPECIAL OPERATIONS DEPARTMENT", 13
  db "TOP SECRET", 13
  db "16.11.3326", 13
  db "SUBJECT: \"MAGIC SPHERE\"", 13
  db 13
  db "       \"CERBERUS\" - \"FIRST\"", 13
  db 13
  db "During the breach of object N1 'Cyclops'", 13
  db "was killed, and the 'Karabass' system", 13
  db "was set to liquidation mode. However,", 13
  db "clone IR-153 (model Ivan Rebrin) withstood", 13
  db "intense mentoscanner radiation until the", 13
  db "bioreactor's resources were exhausted,", 13
  db "contacted the orbital base, and called", 13
  db "for rescue. The lab was cleared, the", 13
  db "clone detained by the liquidation team.", 13
  db 13
  db "   12.10               \"CERBERUS\"", 13
  db "Press G to return to menu"
  db _endByte

GAMEOVER_4: ; normal ending
  db "------------------------------------------"
  db " Game Over", 13
  db "------------------------------------------"
  db "The sight didn't inspire optimism,", 13
  db "so I didn't call the evacuation team,", 13
  db "but left the destroyed base on my own.", 13
  db "If only I could reach the spaceport..", 13
  db "------------------------------------------"
  db "You finished the game! Hurray!", 13, 13
  db "Press G to return to menu or any other", 13
  db "key to continue"
  db _endByte

GAMEOVER_5: ; exit without spacesuit and with closed door
  db "------------------------------------------"
  db " Game Over", 13
  db "------------------------------------------"
  db "Without protective gear in the acidic", 13
  db "atmosphere of the planet, I didn't last", 13
  db "long..", 13
  db "------------------------------------------"
  db "The hero died, that's how it turned out.", 13
  db "Press G to return to menu"
  db _endByte

PRIVATE_HELP:
  db "Research program. Top secret.", 13
  db "------------------------------------------"
  db "..Apparently, exposure to planet MURK and", 13
  db "contact with the Wanderer caused changes", 13
  db "in the genetic material of object N1..", 13
  db 13
  db "..Research of the so-called 'Wanderers'", 13
  db "Z-chromosome' will allow us..", 13
  db 13
  db "..Used clones can be utilized as fuel", 13
  db "for the bioreactor..", 13
  db _endByte

ALARM_HELP:
  db "Emergency protocol activation", 13
  db "------------------------------------------"
  db "..open the safe with a personal key card,", 13
  db "take the red envelope with emergency codes,", 13
  db "enter the launch codes on the terminal in", 13
  db "the meeting room.."
  db _endByte

GENETIC_HELP:
  db "Genetic reference", 13
  db "------------------------------------------"
  db "..Z-introns act as a buffer, maintaining", 13
  db "a certain level of DNA spiralization in", 13
  db "actively transcribed loci.."
  db _endByte

BIOTESLA_HELP:
  db "Bioreactor setup and maintenance", 13
  db "------------------------------------------"
  db "..To start the energy production cycle,", 13
  db "at least 6 biocontainers are needed..", 13
  db 13
  db "..Biocontainers can be filled with both", 13
  db "plant and animal material. Before filling,", 13
  db "the material should be crushed to", 13
  db "acceptable sizes so that its particles", 13
  db "pass through the biocontainer's vacuum", 13
  db "collector without obstruction.."
  db _endByte

GAMEOVER_4_0:
  db "7TH SPECIAL OPERATIONS DEPARTMENT", 13
  db "TOP SECRET", 13
  db "16.11.3326", 13
  db "SUBJECT: \"MAGIC SPHERE\"", 13
  db 13
  db "       \"CERBERUS\" - \"FIRST\"", 13
  db 13
  db "..module 'Karabass' breached, 'Cyclops'", 13
  db "killed, personnel liquidation system", 13
  db "activated, object N1's stasis chamber", 13
  db "empty..", 13
  db 13
  db "..clones HE-12, GE-115, CHP-123 killed", 13
  db "by shots from 'Cyclops' energy weapon,", 13
  db "PCH-118 destroyed by 'Karabass' system", 13
  db "radiation..", 13
  db 13
  db "..clone IR-153 withstood prolonged", 13
  db "intense mentoscanner radiation until the", 13
  db "bioreactor's resources were exhausted,", 13
  db "infiltrated the 'Karabass' module, and", 13
  db "escaped into the jungle in a heavy combat", 13
  db "spacesuit, search underway.."
  db _endByte

Base_energy_on:
  db "I inserted the last biocontainer and heard", 13
  db "the bioreactor humming..",0

Energy_monitor_show:
  db "Base energy supply: 100%",0

Tambur_open:
  db "Airlock open",0

Tambur_close:
  db "Airlock closed",0

CALL_HELP_NO_CODE:
  db "This was an emergency terminal, but I", 13
  db "didn't know the evacuation protocol codes.."
  db _endByte

NO_WAY_SCAF:
  db "I didn't dare to venture too far from the", 13
  db "base in just a light spacesuit.."
  db _endByte

SHOW_SIREN:
  db "A warning siren sounded and the power", 13
  db "went out throughout the base.."
  db _endByte

FOUND_ALERT_CODE:
  db "The safe opened. I took the envelope and", 13
  db "read the emergency protocol code inside.."
  db _endByte

CELL_TYPE_NAMES:
Empty_cell_name: db " ",0
Floor_cell_name: db "Tile",0
Computer_cell_name: db "Terminal",0
Computer_break_cell_name: db "Broken terminal",0

Door_cell_name: db "Door",0
DoorHard_cell_name: db "Airlock door",0
Wall_cell_name: db "Heavy armor plate",0
Bed_cell_name: db "Bed",0
Trash_cell_name: db "Small debris and trash",0
Trash_empty_cell_name: db "Small trash. Useless",0

Soft_wall_name: db "Soft decorative wall",0

Shard_item_name: db "Sharp plastic shard",0
Chair_item_name: db "Chair",0

; chief
player_name1: db "Clone \"Khadzhiev Emil\"", 0
; scientist
player_name2: db "Clone \"Goranov Encho\"", 0
; scientist 
player_name3: db "Clone \"Chakarov Petar\"", 0
; technician
player_name4: db "Clone \"Ivan Rebrin\"", 0
; technician
player_name5: db "Clone \"Panchev Zlatko\"", 0

Electronic_cell_name: db "Electronic control unit",0
Electronic_break_name: db "Broken electronics", 0

Not_get_plant:
  db "The plant wouldn't fit through the",13
  db "biocontainer's vacuum collector", 0

Not_get_body:
  db "The body wouldn't fit through the",13
  db "biocontainer's vacuum collector", 0

Canister_full:
  db "Container already full",0

Canister_fill:
  db "The vacuum collector sucked in biomass",13
  db "and the container filled up",0

Grass_cell_name: db "Grass", 0
Bush_cell_name: db "Bush", 0
PlantPot_cell_name: db "Potted plant", 0
Gravel_cell_name: db "Gravel", 0
Sand_cell_name: db "Sand", 0
CraterSmall_cell_name: db "Ground dent", 0
AirLand_cell_name: db "Landing pad", 0
NavLight_cell_name: db "Navigation lights", 0
Acid_cell_name: db "Puddle of acid juice", 0

Table_cell_name: db "Table", 0
Keramit_cell_name: db "Ceramite", 0

Safe_cell_name: db "Safe", 0
Safe_try_hit_mess:
  db "Not even a dent remained on the safe...", 0

PDA_cell_name: db "Electronic tablet", 0
Book_cell_name: db "Book", 0

RedCard_cell_name: db "Chief's safe key card", 0

Canister_cell_name: db "Full biocontainer", 0
CanisterEmpty_cell_name: db "Empty biocontainer", 0
CanisterPowered_cell_name: db "Active biocontainer", 0
Generator_cell_name: db "Biofuel reactor", 0

WallHole_name: db "Large hole in the wall",0
WallGrid_name: db "Metal grate", 0
WallCavity_name: db "Empty electronics box", 0

Body_no_get: 
  db "I don't feel like carrying a dead body..", 0

Body_cell_name:
  db "Human corpse, killed by energy",13
  db "weapon", 0

BodyTech_cell_name:
  db "Body of a person in a technician's jacket,",13
  db "no visible damage", 0

BodyInScaf_cell_name:
  db "Body of a person in a spacesuit, the suit",13
  db "was pierced by energy weapon and is",13
  db "unusable.", 0

Anabiose_cell_name: db "Stasis chamber", 0
AnabioseOpen_cell_name: db "Open stasis chamber", 0

Anaboise_do_open:
  db "I opened the chamber, an unformed clone",13
  db "spilled right at my feet..",0

Blood_cell_name: db "Biological remains", 0

Analyzer_cell_name: db "Analyzer", 0
Mentoscanner_cell_name: db "Mentoscanner", 0
ElectonicDestroy_cell_name: db "Equipment wreckage..", 0

Nippers_item_name: db "Acid-resistant hydraulic cutter", 0
Wrench_cell_name: db "Wrench-crowbar", 0

ScafPlace_cell_name: db "Spacesuit rack", 0
Scaf_cell_name: db "Light spacesuit", 0
HardScaf_cell_name: db "Heavy combat spacesuit", 0

Nipple_cell_name: db "Biocontainer nozzle", 0

tHeroName2 defb " ",0

WallGrid_false_mess:
  db "The thick grate bars wouldn't budge..",0

Soft_wall_show_electronic:
  db "Behind the decorative wall panel,",13
  db "a control panel was revealed..",0

Not_away_from_base: 
  db "I didn't dare to venture into the acid",13
  db "jungles in just a light spacesuit..",0

Electronic_kick_mess:
  db "The fragile microchips broke!!",0

Electronic_kick_open_mess:
  db "Done! Power to the door removed.",0

Kick_fault_mess:
  db "No result. Nothing happened..",0

Kick_shard_mess:
  db "Not even a scratch remained..",0

Door_not_open_mess:
  db "The door wouldn't open..",0

Take_bed_mess:
  db "The bed was bolted to the floor and",13
  db "wouldn't move.. ",0

Take_trash_mess:
  db "I picked up a sharp piece of plastic",13
  db "from the pile of debris..",0

Keramit_nohit_mess:
  db "Hitting the ceramite was pointless..", 0

Shard_to_soft_wall_mess
  db "I cut a hole in the soft decorative",13
  db "wall panel..",0

Soft_wall_clean
  db "I tore off the remains of the decorative",13
  db "wall panel.",0

Computer_break_mess:
  db "The computer screen cracked..",0

Computer_add_shard_mess 
  db "One more good hit and the terminal was",13
  db "completely destroyed..",0

Soft_wall_hit_mess:
  db "The blow was absorbed by the soft wall.",0

Computer_off_mess:
  db "The terminal was password-protected.",13
  db "I pressed some keys and it shut down..", 0

Computer_off_hit_mess:
  db "Shut down..", 0

Fuu_mainac_mess:
  db "Ew, you're such a maniac..", 0