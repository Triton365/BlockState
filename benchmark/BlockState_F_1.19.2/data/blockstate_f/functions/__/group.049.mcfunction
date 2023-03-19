execute if block ~ ~ ~ cave_air run data modify storage blockstate_f: BlockState set value {Name:"minecraft:cave_air"}
execute if block ~ ~ ~ cave_vines run function blockstate_f:__/block.cave_vines
execute if block ~ ~ ~ cave_vines_plant run function blockstate_f:__/block.cave_vines_plant
execute if block ~ ~ ~ chain run function blockstate_f:__/block.chain