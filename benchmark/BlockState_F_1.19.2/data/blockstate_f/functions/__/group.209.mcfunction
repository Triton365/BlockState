execute if block ~ ~ ~ pink_wool run data modify storage blockstate_f: BlockState set value {Name:"minecraft:pink_wool"}
execute if block ~ ~ ~ piston run function blockstate_f:__/block.piston
execute if block ~ ~ ~ piston_head run function blockstate_f:__/block.piston_head