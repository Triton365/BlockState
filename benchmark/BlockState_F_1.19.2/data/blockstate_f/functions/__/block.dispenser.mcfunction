data modify storage blockstate_f: BlockState set value {Name:"minecraft:dispenser"}
execute if block ~ ~ ~ #blockstate_f:all[facing=down] run data modify storage blockstate_f: BlockState.Properties.facing set value "down"
execute if block ~ ~ ~ #blockstate_f:all[facing=east] run data modify storage blockstate_f: BlockState.Properties.facing set value "east"
execute if block ~ ~ ~ #blockstate_f:all[facing=north] run data modify storage blockstate_f: BlockState.Properties.facing set value "north"
execute if block ~ ~ ~ #blockstate_f:all[facing=south] run data modify storage blockstate_f: BlockState.Properties.facing set value "south"
execute if block ~ ~ ~ #blockstate_f:all[facing=up] run data modify storage blockstate_f: BlockState.Properties.facing set value "up"
execute if block ~ ~ ~ #blockstate_f:all[facing=west] run data modify storage blockstate_f: BlockState.Properties.facing set value "west"
execute if block ~ ~ ~ #blockstate_f:all[triggered=false] run data modify storage blockstate_f: BlockState.Properties.triggered set value "false"
execute if block ~ ~ ~ #blockstate_f:all[triggered=true] run data modify storage blockstate_f: BlockState.Properties.triggered set value "true"