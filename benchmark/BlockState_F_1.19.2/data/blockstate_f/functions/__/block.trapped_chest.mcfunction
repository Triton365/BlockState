data modify storage blockstate_f: BlockState set value {Name:"minecraft:trapped_chest",Properties:{type:"left",facing:"east",waterlogged:"false"}}
execute if block ~ ~ ~ #blockstate_f:all[type=right] run data modify storage blockstate_f: BlockState.Properties.type set value "right"
execute if block ~ ~ ~ #blockstate_f:all[type=single] run data modify storage blockstate_f: BlockState.Properties.type set value "single"
execute if block ~ ~ ~ #blockstate_f:all[facing=north] run data modify storage blockstate_f: BlockState.Properties.facing set value "north"
execute if block ~ ~ ~ #blockstate_f:all[facing=south] run data modify storage blockstate_f: BlockState.Properties.facing set value "south"
execute if block ~ ~ ~ #blockstate_f:all[facing=west] run data modify storage blockstate_f: BlockState.Properties.facing set value "west"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=true] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "true"