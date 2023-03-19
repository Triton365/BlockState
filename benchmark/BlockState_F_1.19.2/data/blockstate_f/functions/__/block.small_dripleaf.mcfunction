data modify storage blockstate_f: BlockState set value {Name:"minecraft:small_dripleaf"}
execute if block ~ ~ ~ #blockstate_f:all[facing=east] run data modify storage blockstate_f: BlockState.Properties.facing set value "east"
execute if block ~ ~ ~ #blockstate_f:all[facing=north] run data modify storage blockstate_f: BlockState.Properties.facing set value "north"
execute if block ~ ~ ~ #blockstate_f:all[facing=south] run data modify storage blockstate_f: BlockState.Properties.facing set value "south"
execute if block ~ ~ ~ #blockstate_f:all[facing=west] run data modify storage blockstate_f: BlockState.Properties.facing set value "west"
execute if block ~ ~ ~ #blockstate_f:all[half=lower] run data modify storage blockstate_f: BlockState.Properties.half set value "lower"
execute if block ~ ~ ~ #blockstate_f:all[half=upper] run data modify storage blockstate_f: BlockState.Properties.half set value "upper"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=false] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "false"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=true] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "true"