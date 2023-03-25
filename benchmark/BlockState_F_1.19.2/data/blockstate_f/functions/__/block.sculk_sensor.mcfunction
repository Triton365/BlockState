data modify storage blockstate_f: BlockState set value {Name:"minecraft:sculk_sensor",Properties:{power:"0",sculk_sensor_phase:"active",waterlogged:"false"}}
execute if predicate blockstate_f:state.power.1..3 run function blockstate_f:__/state.power.1.2.3
execute if predicate blockstate_f:state.power.4..7 run function blockstate_f:__/state.power.4.5.6.7
execute if predicate blockstate_f:state.power.8..11 run function blockstate_f:__/state.power.8.9.10.11
execute if predicate blockstate_f:state.power.12..15 run function blockstate_f:__/state.power.12.13.14.15
execute if block ~ ~ ~ #blockstate_f:all[sculk_sensor_phase=cooldown] run data modify storage blockstate_f: BlockState.Properties.sculk_sensor_phase set value "cooldown"
execute if block ~ ~ ~ #blockstate_f:all[sculk_sensor_phase=inactive] run data modify storage blockstate_f: BlockState.Properties.sculk_sensor_phase set value "inactive"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=true] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "true"