execute if block ~ ~ ~ dead_bush run data modify storage blockstate_f: BlockState set value {Name:"minecraft:dead_bush"}
execute if block ~ ~ ~ dead_fire_coral run function blockstate_f:__/block.dead_fire_coral
execute if block ~ ~ ~ dead_fire_coral_block run data modify storage blockstate_f: BlockState set value {Name:"minecraft:dead_fire_coral_block"}
execute if block ~ ~ ~ dead_fire_coral_fan run function blockstate_f:__/block.dead_fire_coral_fan