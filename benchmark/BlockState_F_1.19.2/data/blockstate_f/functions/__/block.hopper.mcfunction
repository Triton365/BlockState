data modify storage blockstate_f: BlockState set value {Name:"minecraft:hopper"}
execute if block ~ ~ ~ #blockstate_f:all[enabled=false] run data modify storage blockstate_f: BlockState.Properties.enabled set value "false"
execute if block ~ ~ ~ #blockstate_f:all[enabled=true] run data modify storage blockstate_f: BlockState.Properties.enabled set value "true"
execute if block ~ ~ ~ #blockstate_f:all[facing=down] run data modify storage blockstate_f: BlockState.Properties.facing set value "down"
execute if block ~ ~ ~ #blockstate_f:all[facing=east] run data modify storage blockstate_f: BlockState.Properties.facing set value "east"
execute if block ~ ~ ~ #blockstate_f:all[facing=north] run data modify storage blockstate_f: BlockState.Properties.facing set value "north"
execute if block ~ ~ ~ #blockstate_f:all[facing=south] run data modify storage blockstate_f: BlockState.Properties.facing set value "south"
execute if block ~ ~ ~ #blockstate_f:all[facing=west] run data modify storage blockstate_f: BlockState.Properties.facing set value "west"