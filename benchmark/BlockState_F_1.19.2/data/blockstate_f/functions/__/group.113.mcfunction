execute if block ~ ~ ~ flower_pot run data modify storage blockstate_f: BlockState set value {Name:"minecraft:flower_pot"}
execute if block ~ ~ ~ flowering_azalea run data modify storage blockstate_f: BlockState set value {Name:"minecraft:flowering_azalea"}
execute if block ~ ~ ~ flowering_azalea_leaves run function blockstate_f:__/block.flowering_azalea_leaves