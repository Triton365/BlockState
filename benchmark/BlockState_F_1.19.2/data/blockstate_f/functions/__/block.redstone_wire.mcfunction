data modify storage blockstate_f: BlockState set value {Name:"minecraft:redstone_wire"}
execute if block ~ ~ ~ #blockstate_f:all[east=none] run data modify storage blockstate_f: BlockState.Properties.east set value "none"
execute if block ~ ~ ~ #blockstate_f:all[east=side] run data modify storage blockstate_f: BlockState.Properties.east set value "side"
execute if block ~ ~ ~ #blockstate_f:all[east=up] run data modify storage blockstate_f: BlockState.Properties.east set value "up"
execute if block ~ ~ ~ #blockstate_f:all[north=none] run data modify storage blockstate_f: BlockState.Properties.north set value "none"
execute if block ~ ~ ~ #blockstate_f:all[north=side] run data modify storage blockstate_f: BlockState.Properties.north set value "side"
execute if block ~ ~ ~ #blockstate_f:all[north=up] run data modify storage blockstate_f: BlockState.Properties.north set value "up"
execute if predicate blockstate_f:state.power.0..3 run function blockstate_f:__/state.power.0.1.2.3
execute if predicate blockstate_f:state.power.4..7 run function blockstate_f:__/state.power.4.5.6.7
execute if predicate blockstate_f:state.power.8..11 run function blockstate_f:__/state.power.8.9.10.11
execute if predicate blockstate_f:state.power.12..15 run function blockstate_f:__/state.power.12.13.14.15
execute if block ~ ~ ~ #blockstate_f:all[south=none] run data modify storage blockstate_f: BlockState.Properties.south set value "none"
execute if block ~ ~ ~ #blockstate_f:all[south=side] run data modify storage blockstate_f: BlockState.Properties.south set value "side"
execute if block ~ ~ ~ #blockstate_f:all[south=up] run data modify storage blockstate_f: BlockState.Properties.south set value "up"
execute if block ~ ~ ~ #blockstate_f:all[west=none] run data modify storage blockstate_f: BlockState.Properties.west set value "none"
execute if block ~ ~ ~ #blockstate_f:all[west=side] run data modify storage blockstate_f: BlockState.Properties.west set value "side"
execute if block ~ ~ ~ #blockstate_f:all[west=up] run data modify storage blockstate_f: BlockState.Properties.west set value "up"