data modify storage blockstate_f: BlockState set value {Name:"minecraft:cave_vines_plant"}
execute if block ~ ~ ~ #blockstate_f:all[berries=false] run data modify storage blockstate_f: BlockState.Properties.berries set value "false"
execute if block ~ ~ ~ #blockstate_f:all[berries=true] run data modify storage blockstate_f: BlockState.Properties.berries set value "true"