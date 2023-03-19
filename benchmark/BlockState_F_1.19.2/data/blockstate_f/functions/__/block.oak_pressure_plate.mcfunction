data modify storage blockstate_f: BlockState set value {Name:"minecraft:oak_pressure_plate"}
execute if block ~ ~ ~ #blockstate_f:all[powered=false] run data modify storage blockstate_f: BlockState.Properties.powered set value "false"
execute if block ~ ~ ~ #blockstate_f:all[powered=true] run data modify storage blockstate_f: BlockState.Properties.powered set value "true"