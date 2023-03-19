execute if block ~ ~ ~ warped_wall_sign run function blockstate_f:__/block.warped_wall_sign
execute if block ~ ~ ~ warped_wart_block run data modify storage blockstate_f: BlockState set value {Name:"minecraft:warped_wart_block"}
execute if block ~ ~ ~ water run function blockstate_f:__/block.water
execute if block ~ ~ ~ water_cauldron run function blockstate_f:__/block.water_cauldron