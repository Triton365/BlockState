execute if block ~ ~ ~ frogspawn run data modify storage blockstate_f: BlockState set value {Name:"minecraft:frogspawn"}
execute if block ~ ~ ~ frosted_ice run function blockstate_f:__/block.frosted_ice
execute if block ~ ~ ~ furnace run function blockstate_f:__/block.furnace
execute if block ~ ~ ~ gilded_blackstone run data modify storage blockstate_f: BlockState set value {Name:"minecraft:gilded_blackstone"}