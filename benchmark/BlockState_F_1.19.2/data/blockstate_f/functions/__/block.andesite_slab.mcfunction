data modify storage blockstate_f: BlockState set value {Name:"minecraft:andesite_slab"}
execute if block ~ ~ ~ #blockstate_f:all[type=bottom] run data modify storage blockstate_f: BlockState.Properties.type set value "bottom"
execute if block ~ ~ ~ #blockstate_f:all[type=double] run data modify storage blockstate_f: BlockState.Properties.type set value "double"
execute if block ~ ~ ~ #blockstate_f:all[type=top] run data modify storage blockstate_f: BlockState.Properties.type set value "top"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=false] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "false"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=true] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "true"