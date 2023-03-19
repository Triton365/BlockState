data modify storage blockstate_f: BlockState set value {Name:"minecraft:waxed_cut_copper_stairs"}
execute if block ~ ~ ~ #blockstate_f:all[facing=east] run data modify storage blockstate_f: BlockState.Properties.facing set value "east"
execute if block ~ ~ ~ #blockstate_f:all[facing=north] run data modify storage blockstate_f: BlockState.Properties.facing set value "north"
execute if block ~ ~ ~ #blockstate_f:all[facing=south] run data modify storage blockstate_f: BlockState.Properties.facing set value "south"
execute if block ~ ~ ~ #blockstate_f:all[facing=west] run data modify storage blockstate_f: BlockState.Properties.facing set value "west"
execute if block ~ ~ ~ #blockstate_f:all[half=bottom] run data modify storage blockstate_f: BlockState.Properties.half set value "bottom"
execute if block ~ ~ ~ #blockstate_f:all[half=top] run data modify storage blockstate_f: BlockState.Properties.half set value "top"
execute if block ~ ~ ~ #blockstate_f:all[shape=inner_left] run data modify storage blockstate_f: BlockState.Properties.shape set value "inner_left"
execute if block ~ ~ ~ #blockstate_f:all[shape=inner_right] run data modify storage blockstate_f: BlockState.Properties.shape set value "inner_right"
execute if block ~ ~ ~ #blockstate_f:all[shape=outer_left] run data modify storage blockstate_f: BlockState.Properties.shape set value "outer_left"
execute if block ~ ~ ~ #blockstate_f:all[shape=outer_right] run data modify storage blockstate_f: BlockState.Properties.shape set value "outer_right"
execute if block ~ ~ ~ #blockstate_f:all[shape=straight] run data modify storage blockstate_f: BlockState.Properties.shape set value "straight"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=false] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "false"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=true] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "true"