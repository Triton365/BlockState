data modify storage blockstate_f: BlockState set value {Name:"minecraft:jukebox"}
execute if block ~ ~ ~ #blockstate_f:all[has_record=false] run data modify storage blockstate_f: BlockState.Properties.has_record set value "false"
execute if block ~ ~ ~ #blockstate_f:all[has_record=true] run data modify storage blockstate_f: BlockState.Properties.has_record set value "true"