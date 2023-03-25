data modify storage blockstate_f: BlockState set value {Name:"minecraft:mangrove_trapdoor",Properties:{facing:"east",half:"bottom",open:"false",powered:"false",waterlogged:"false"}}
execute if block ~ ~ ~ #blockstate_f:all[facing=north] run data modify storage blockstate_f: BlockState.Properties.facing set value "north"
execute if block ~ ~ ~ #blockstate_f:all[facing=south] run data modify storage blockstate_f: BlockState.Properties.facing set value "south"
execute if block ~ ~ ~ #blockstate_f:all[facing=west] run data modify storage blockstate_f: BlockState.Properties.facing set value "west"
execute if block ~ ~ ~ #blockstate_f:all[half=top] run data modify storage blockstate_f: BlockState.Properties.half set value "top"
execute if block ~ ~ ~ #blockstate_f:all[open=true] run data modify storage blockstate_f: BlockState.Properties.open set value "true"
execute if block ~ ~ ~ #blockstate_f:all[powered=true] run data modify storage blockstate_f: BlockState.Properties.powered set value "true"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=true] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "true"