data modify storage blockstate_f: BlockState set value {Name:"minecraft:warped_trapdoor"}
execute if block ~ ~ ~ #blockstate_f:all[facing=east] run data modify storage blockstate_f: BlockState.Properties.facing set value "east"
execute if block ~ ~ ~ #blockstate_f:all[facing=north] run data modify storage blockstate_f: BlockState.Properties.facing set value "north"
execute if block ~ ~ ~ #blockstate_f:all[facing=south] run data modify storage blockstate_f: BlockState.Properties.facing set value "south"
execute if block ~ ~ ~ #blockstate_f:all[facing=west] run data modify storage blockstate_f: BlockState.Properties.facing set value "west"
execute if block ~ ~ ~ #blockstate_f:all[half=bottom] run data modify storage blockstate_f: BlockState.Properties.half set value "bottom"
execute if block ~ ~ ~ #blockstate_f:all[half=top] run data modify storage blockstate_f: BlockState.Properties.half set value "top"
execute if block ~ ~ ~ #blockstate_f:all[open=false] run data modify storage blockstate_f: BlockState.Properties.open set value "false"
execute if block ~ ~ ~ #blockstate_f:all[open=true] run data modify storage blockstate_f: BlockState.Properties.open set value "true"
execute if block ~ ~ ~ #blockstate_f:all[powered=false] run data modify storage blockstate_f: BlockState.Properties.powered set value "false"
execute if block ~ ~ ~ #blockstate_f:all[powered=true] run data modify storage blockstate_f: BlockState.Properties.powered set value "true"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=false] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "false"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=true] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "true"