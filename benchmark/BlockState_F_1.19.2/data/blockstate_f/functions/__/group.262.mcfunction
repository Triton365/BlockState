execute if block ~ ~ ~ seagrass run data modify storage blockstate_f: BlockState set value {Name:"minecraft:seagrass"}
execute if block ~ ~ ~ shroomlight run data modify storage blockstate_f: BlockState set value {Name:"minecraft:shroomlight"}
execute if block ~ ~ ~ shulker_box run function blockstate_f:__/block.shulker_box
execute if block ~ ~ ~ skeleton_skull run function blockstate_f:__/block.skeleton_skull