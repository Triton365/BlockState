execute if block ~ ~ ~ jungle_planks run data modify storage blockstate_f: BlockState set value {Name:"minecraft:jungle_planks"}
execute if block ~ ~ ~ jungle_pressure_plate run function blockstate_f:__/block.jungle_pressure_plate
execute if block ~ ~ ~ jungle_sapling run function blockstate_f:__/block.jungle_sapling
execute if block ~ ~ ~ jungle_sign run function blockstate_f:__/block.jungle_sign