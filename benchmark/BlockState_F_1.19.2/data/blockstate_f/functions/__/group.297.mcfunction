execute if block ~ ~ ~ twisting_vines_plant run data modify storage blockstate_f: BlockState set value {Name:"minecraft:twisting_vines_plant"}
execute if block ~ ~ ~ verdant_froglight run function blockstate_f:__/block.verdant_froglight
execute if block ~ ~ ~ vine run function blockstate_f:__/block.vine
execute if block ~ ~ ~ void_air run data modify storage blockstate_f: BlockState set value {Name:"minecraft:void_air"}