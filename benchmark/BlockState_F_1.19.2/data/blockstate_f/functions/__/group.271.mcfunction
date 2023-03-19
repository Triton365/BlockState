execute if block ~ ~ ~ snow_block run data modify storage blockstate_f: BlockState set value {Name:"minecraft:snow_block"}
execute if block ~ ~ ~ soul_campfire run function blockstate_f:__/block.soul_campfire
execute if block ~ ~ ~ soul_fire run data modify storage blockstate_f: BlockState set value {Name:"minecraft:soul_fire"}
execute if block ~ ~ ~ soul_lantern run function blockstate_f:__/block.soul_lantern