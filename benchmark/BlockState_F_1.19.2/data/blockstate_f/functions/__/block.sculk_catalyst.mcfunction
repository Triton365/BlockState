data modify storage blockstate_f: BlockState set value {Name:"minecraft:sculk_catalyst"}
execute if block ~ ~ ~ #blockstate_f:all[bloom=false] run data modify storage blockstate_f: BlockState.Properties.bloom set value "false"
execute if block ~ ~ ~ #blockstate_f:all[bloom=true] run data modify storage blockstate_f: BlockState.Properties.bloom set value "true"