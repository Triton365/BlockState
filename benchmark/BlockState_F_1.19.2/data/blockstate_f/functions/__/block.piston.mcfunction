data modify storage blockstate_f: BlockState set value {Name:"minecraft:piston"}
execute if block ~ ~ ~ #blockstate_f:all[extended=false] run data modify storage blockstate_f: BlockState.Properties.extended set value "false"
execute if block ~ ~ ~ #blockstate_f:all[extended=true] run data modify storage blockstate_f: BlockState.Properties.extended set value "true"
execute if block ~ ~ ~ #blockstate_f:all[facing=down] run data modify storage blockstate_f: BlockState.Properties.facing set value "down"
execute if block ~ ~ ~ #blockstate_f:all[facing=east] run data modify storage blockstate_f: BlockState.Properties.facing set value "east"
execute if block ~ ~ ~ #blockstate_f:all[facing=north] run data modify storage blockstate_f: BlockState.Properties.facing set value "north"
execute if block ~ ~ ~ #blockstate_f:all[facing=south] run data modify storage blockstate_f: BlockState.Properties.facing set value "south"
execute if block ~ ~ ~ #blockstate_f:all[facing=up] run data modify storage blockstate_f: BlockState.Properties.facing set value "up"
execute if block ~ ~ ~ #blockstate_f:all[facing=west] run data modify storage blockstate_f: BlockState.Properties.facing set value "west"