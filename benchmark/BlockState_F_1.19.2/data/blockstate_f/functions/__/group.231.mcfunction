execute if block ~ ~ ~ powder_snow run data modify storage blockstate_f: BlockState set value {Name:"minecraft:powder_snow"}
execute if block ~ ~ ~ powder_snow_cauldron run function blockstate_f:__/block.powder_snow_cauldron
execute if block ~ ~ ~ powered_rail run function blockstate_f:__/block.powered_rail
execute if block ~ ~ ~ prismarine run data modify storage blockstate_f: BlockState set value {Name:"minecraft:prismarine"}