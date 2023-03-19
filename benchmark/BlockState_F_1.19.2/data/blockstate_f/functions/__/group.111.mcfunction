execute if block ~ ~ ~ fire_coral_block run data modify storage blockstate_f: BlockState set value {Name:"minecraft:fire_coral_block"}
execute if block ~ ~ ~ fire_coral_fan run function blockstate_f:__/block.fire_coral_fan
execute if block ~ ~ ~ fire_coral_wall_fan run function blockstate_f:__/block.fire_coral_wall_fan
execute if block ~ ~ ~ fletching_table run data modify storage blockstate_f: BlockState set value {Name:"minecraft:fletching_table"}