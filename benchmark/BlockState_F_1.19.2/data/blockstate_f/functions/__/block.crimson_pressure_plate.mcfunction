data modify storage blockstate_f: BlockState set value {Name:"minecraft:crimson_pressure_plate",Properties:{powered:"false"}}
execute if block ~ ~ ~ #blockstate_f:all[powered=true] run data modify storage blockstate_f: BlockState.Properties.powered set value "true"