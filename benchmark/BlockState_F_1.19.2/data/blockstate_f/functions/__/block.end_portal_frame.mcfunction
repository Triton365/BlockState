data modify storage blockstate_f: BlockState set value {Name:"minecraft:end_portal_frame"}
execute if block ~ ~ ~ #blockstate_f:all[eye=false] run data modify storage blockstate_f: BlockState.Properties.eye set value "false"
execute if block ~ ~ ~ #blockstate_f:all[eye=true] run data modify storage blockstate_f: BlockState.Properties.eye set value "true"
execute if block ~ ~ ~ #blockstate_f:all[facing=east] run data modify storage blockstate_f: BlockState.Properties.facing set value "east"
execute if block ~ ~ ~ #blockstate_f:all[facing=north] run data modify storage blockstate_f: BlockState.Properties.facing set value "north"
execute if block ~ ~ ~ #blockstate_f:all[facing=south] run data modify storage blockstate_f: BlockState.Properties.facing set value "south"
execute if block ~ ~ ~ #blockstate_f:all[facing=west] run data modify storage blockstate_f: BlockState.Properties.facing set value "west"