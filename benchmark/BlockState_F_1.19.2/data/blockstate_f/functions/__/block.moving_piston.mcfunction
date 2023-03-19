data modify storage blockstate_f: BlockState set value {Name:"minecraft:moving_piston"}
execute if block ~ ~ ~ #blockstate_f:all[type=normal] run data modify storage blockstate_f: BlockState.Properties.type set value "normal"
execute if block ~ ~ ~ #blockstate_f:all[type=sticky] run data modify storage blockstate_f: BlockState.Properties.type set value "sticky"
execute if block ~ ~ ~ #blockstate_f:all[facing=down] run data modify storage blockstate_f: BlockState.Properties.facing set value "down"
execute if block ~ ~ ~ #blockstate_f:all[facing=east] run data modify storage blockstate_f: BlockState.Properties.facing set value "east"
execute if block ~ ~ ~ #blockstate_f:all[facing=north] run data modify storage blockstate_f: BlockState.Properties.facing set value "north"
execute if block ~ ~ ~ #blockstate_f:all[facing=south] run data modify storage blockstate_f: BlockState.Properties.facing set value "south"
execute if block ~ ~ ~ #blockstate_f:all[facing=up] run data modify storage blockstate_f: BlockState.Properties.facing set value "up"
execute if block ~ ~ ~ #blockstate_f:all[facing=west] run data modify storage blockstate_f: BlockState.Properties.facing set value "west"