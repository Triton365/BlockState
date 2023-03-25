data modify storage blockstate_f: BlockState set value {Name:"minecraft:chain",Properties:{axis:"x",waterlogged:"false"}}
execute if block ~ ~ ~ #blockstate_f:all[axis=y] run data modify storage blockstate_f: BlockState.Properties.axis set value "y"
execute if block ~ ~ ~ #blockstate_f:all[axis=z] run data modify storage blockstate_f: BlockState.Properties.axis set value "z"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=true] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "true"