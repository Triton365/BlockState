execute if block ~ ~ ~ white_wool run data modify storage blockstate_f: BlockState set value {Name:"minecraft:white_wool"}
execute if block ~ ~ ~ wither_rose run data modify storage blockstate_f: BlockState set value {Name:"minecraft:wither_rose"}
execute if block ~ ~ ~ wither_skeleton_skull run function blockstate_f:__/block.wither_skeleton_skull
execute if block ~ ~ ~ wither_skeleton_wall_skull run function blockstate_f:__/block.wither_skeleton_wall_skull