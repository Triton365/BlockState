data modify storage blockstate_f: BlockState set value {Name:"minecraft:bubble_column"}
execute if block ~ ~ ~ #blockstate_f:all[drag=false] run data modify storage blockstate_f: BlockState.Properties.drag set value "false"
execute if block ~ ~ ~ #blockstate_f:all[drag=true] run data modify storage blockstate_f: BlockState.Properties.drag set value "true"