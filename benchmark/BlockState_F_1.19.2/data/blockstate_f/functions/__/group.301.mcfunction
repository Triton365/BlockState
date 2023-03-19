execute if block ~ ~ ~ warped_planks run data modify storage blockstate_f: BlockState set value {Name:"minecraft:warped_planks"}
execute if block ~ ~ ~ warped_pressure_plate run function blockstate_f:__/block.warped_pressure_plate
execute if block ~ ~ ~ warped_roots run data modify storage blockstate_f: BlockState set value {Name:"minecraft:warped_roots"}
execute if block ~ ~ ~ warped_sign run function blockstate_f:__/block.warped_sign