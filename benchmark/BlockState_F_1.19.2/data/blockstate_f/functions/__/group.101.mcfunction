execute if block ~ ~ ~ dragon_egg run data modify storage blockstate_f: BlockState set value {Name:"minecraft:dragon_egg"}
execute if block ~ ~ ~ dragon_head run function blockstate_f:__/block.dragon_head
execute if block ~ ~ ~ dragon_wall_head run function blockstate_f:__/block.dragon_wall_head
execute if block ~ ~ ~ dried_kelp_block run data modify storage blockstate_f: BlockState set value {Name:"minecraft:dried_kelp_block"}