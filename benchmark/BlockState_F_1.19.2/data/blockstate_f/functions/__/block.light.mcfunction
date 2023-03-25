data modify storage blockstate_f: BlockState set value {Name:"minecraft:light",Properties:{level:"0",waterlogged:"false"}}
execute if predicate blockstate_f:state.level.1..3 run function blockstate_f:__/state.level.1.2.3
execute if predicate blockstate_f:state.level.4..7 run function blockstate_f:__/state.level.4.5.6.7
execute if predicate blockstate_f:state.level.8..11 run function blockstate_f:__/state.level.8.9.10.11
execute if predicate blockstate_f:state.level.12..15 run function blockstate_f:__/state.level.12.13.14.15
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=true] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "true"