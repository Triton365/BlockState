data modify storage blockstate_f: BlockState set value {Name:"minecraft:fire_coral",Properties:{waterlogged:"false"}}
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=true] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "true"