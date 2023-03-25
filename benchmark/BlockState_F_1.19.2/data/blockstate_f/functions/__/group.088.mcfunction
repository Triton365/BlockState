execute if block ~ ~ ~ mossy_stone_bricks run data modify storage blockstate_f: BlockState set value {Name:"minecraft:mossy_stone_bricks"}
execute if block ~ ~ ~ black_carpet run data modify storage blockstate_f: BlockState set value {Name:"minecraft:black_carpet"}
execute if block ~ ~ ~ dead_horn_coral_block run data modify storage blockstate_f: BlockState set value {Name:"minecraft:dead_horn_coral_block"}
execute if block ~ ~ ~ dead_horn_coral run function blockstate_f:__/block.dead_horn_coral