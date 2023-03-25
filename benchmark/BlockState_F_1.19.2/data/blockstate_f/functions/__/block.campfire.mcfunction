data modify storage blockstate_f: BlockState set value {Name:"minecraft:campfire",Properties:{facing:"east",lit:"false",signal_fire:"false",waterlogged:"false"}}
execute if block ~ ~ ~ #blockstate_f:all[facing=north] run data modify storage blockstate_f: BlockState.Properties.facing set value "north"
execute if block ~ ~ ~ #blockstate_f:all[facing=south] run data modify storage blockstate_f: BlockState.Properties.facing set value "south"
execute if block ~ ~ ~ #blockstate_f:all[facing=west] run data modify storage blockstate_f: BlockState.Properties.facing set value "west"
execute if block ~ ~ ~ #blockstate_f:all[lit=true] run data modify storage blockstate_f: BlockState.Properties.lit set value "true"
execute if block ~ ~ ~ #blockstate_f:all[signal_fire=true] run data modify storage blockstate_f: BlockState.Properties.signal_fire set value "true"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=true] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "true"