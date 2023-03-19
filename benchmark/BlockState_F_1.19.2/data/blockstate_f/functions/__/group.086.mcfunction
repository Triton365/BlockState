execute if block ~ ~ ~ dead_brain_coral_block run data modify storage blockstate_f: BlockState set value {Name:"minecraft:dead_brain_coral_block"}
execute if block ~ ~ ~ dead_brain_coral_fan run function blockstate_f:__/block.dead_brain_coral_fan
execute if block ~ ~ ~ dead_brain_coral_wall_fan run function blockstate_f:__/block.dead_brain_coral_wall_fan
execute if block ~ ~ ~ dead_bubble_coral run function blockstate_f:__/block.dead_bubble_coral