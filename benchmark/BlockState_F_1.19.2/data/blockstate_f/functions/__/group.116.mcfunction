execute if block ~ ~ ~ gold_block run data modify storage blockstate_f: BlockState set value {Name:"minecraft:gold_block"}
execute if block ~ ~ ~ gold_ore run data modify storage blockstate_f: BlockState set value {Name:"minecraft:gold_ore"}
execute if block ~ ~ ~ granite run data modify storage blockstate_f: BlockState set value {Name:"minecraft:granite"}
execute if block ~ ~ ~ granite_slab run function blockstate_f:__/block.granite_slab