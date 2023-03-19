execute if block ~ ~ ~ diorite_wall run function blockstate_f:__/block.diorite_wall
execute if block ~ ~ ~ dirt run data modify storage blockstate_f: BlockState set value {Name:"minecraft:dirt"}
execute if block ~ ~ ~ dirt_path run data modify storage blockstate_f: BlockState set value {Name:"minecraft:dirt_path"}
execute if block ~ ~ ~ dispenser run function blockstate_f:__/block.dispenser