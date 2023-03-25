data modify storage blockstate_f: BlockState set value {Name:"minecraft:polished_blackstone_slab",Properties:{type:"bottom",waterlogged:"false"}}
execute if block ~ ~ ~ #blockstate_f:all[type=double] run data modify storage blockstate_f: BlockState.Properties.type set value "double"
execute if block ~ ~ ~ #blockstate_f:all[type=top] run data modify storage blockstate_f: BlockState.Properties.type set value "top"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=true] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "true"