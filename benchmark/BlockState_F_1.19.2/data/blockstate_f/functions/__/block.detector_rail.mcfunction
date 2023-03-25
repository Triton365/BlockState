data modify storage blockstate_f: BlockState set value {Name:"minecraft:detector_rail",Properties:{powered:"false",shape:"ascending_east",waterlogged:"false"}}
execute if block ~ ~ ~ #blockstate_f:all[powered=true] run data modify storage blockstate_f: BlockState.Properties.powered set value "true"
execute if block ~ ~ ~ #blockstate_f:all[shape=ascending_north] run data modify storage blockstate_f: BlockState.Properties.shape set value "ascending_north"
execute if block ~ ~ ~ #blockstate_f:all[shape=ascending_south] run data modify storage blockstate_f: BlockState.Properties.shape set value "ascending_south"
execute if block ~ ~ ~ #blockstate_f:all[shape=ascending_west] run data modify storage blockstate_f: BlockState.Properties.shape set value "ascending_west"
execute if block ~ ~ ~ #blockstate_f:all[shape=east_west] run data modify storage blockstate_f: BlockState.Properties.shape set value "east_west"
execute if block ~ ~ ~ #blockstate_f:all[shape=north_south] run data modify storage blockstate_f: BlockState.Properties.shape set value "north_south"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=true] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "true"