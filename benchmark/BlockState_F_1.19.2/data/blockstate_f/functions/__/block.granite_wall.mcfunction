data modify storage blockstate_f: BlockState set value {Name:"minecraft:granite_wall"}
execute if block ~ ~ ~ #blockstate_f:all[east=low] run data modify storage blockstate_f: BlockState.Properties.east set value "low"
execute if block ~ ~ ~ #blockstate_f:all[east=none] run data modify storage blockstate_f: BlockState.Properties.east set value "none"
execute if block ~ ~ ~ #blockstate_f:all[east=tall] run data modify storage blockstate_f: BlockState.Properties.east set value "tall"
execute if block ~ ~ ~ #blockstate_f:all[north=low] run data modify storage blockstate_f: BlockState.Properties.north set value "low"
execute if block ~ ~ ~ #blockstate_f:all[north=none] run data modify storage blockstate_f: BlockState.Properties.north set value "none"
execute if block ~ ~ ~ #blockstate_f:all[north=tall] run data modify storage blockstate_f: BlockState.Properties.north set value "tall"
execute if block ~ ~ ~ #blockstate_f:all[south=low] run data modify storage blockstate_f: BlockState.Properties.south set value "low"
execute if block ~ ~ ~ #blockstate_f:all[south=none] run data modify storage blockstate_f: BlockState.Properties.south set value "none"
execute if block ~ ~ ~ #blockstate_f:all[south=tall] run data modify storage blockstate_f: BlockState.Properties.south set value "tall"
execute if block ~ ~ ~ #blockstate_f:all[up=false] run data modify storage blockstate_f: BlockState.Properties.up set value "false"
execute if block ~ ~ ~ #blockstate_f:all[up=true] run data modify storage blockstate_f: BlockState.Properties.up set value "true"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=false] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "false"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=true] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "true"
execute if block ~ ~ ~ #blockstate_f:all[west=low] run data modify storage blockstate_f: BlockState.Properties.west set value "low"
execute if block ~ ~ ~ #blockstate_f:all[west=none] run data modify storage blockstate_f: BlockState.Properties.west set value "none"
execute if block ~ ~ ~ #blockstate_f:all[west=tall] run data modify storage blockstate_f: BlockState.Properties.west set value "tall"