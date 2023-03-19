data modify storage blockstate_f: BlockState set value {Name:"minecraft:mycelium"}
execute if block ~ ~ ~ #blockstate_f:all[snowy=false] run data modify storage blockstate_f: BlockState.Properties.snowy set value "false"
execute if block ~ ~ ~ #blockstate_f:all[snowy=true] run data modify storage blockstate_f: BlockState.Properties.snowy set value "true"