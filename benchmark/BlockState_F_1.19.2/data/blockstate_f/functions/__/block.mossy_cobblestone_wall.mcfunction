data modify storage blockstate_f: BlockState set value {Name:"minecraft:mossy_cobblestone_wall",Properties:{east:"low",north:"low",south:"low",up:"false",waterlogged:"false",west:"low"}}
execute if block ~ ~ ~ #blockstate_f:all[east=none] run data modify storage blockstate_f: BlockState.Properties.east set value "none"
execute if block ~ ~ ~ #blockstate_f:all[east=tall] run data modify storage blockstate_f: BlockState.Properties.east set value "tall"
execute if block ~ ~ ~ #blockstate_f:all[north=none] run data modify storage blockstate_f: BlockState.Properties.north set value "none"
execute if block ~ ~ ~ #blockstate_f:all[north=tall] run data modify storage blockstate_f: BlockState.Properties.north set value "tall"
execute if block ~ ~ ~ #blockstate_f:all[south=none] run data modify storage blockstate_f: BlockState.Properties.south set value "none"
execute if block ~ ~ ~ #blockstate_f:all[south=tall] run data modify storage blockstate_f: BlockState.Properties.south set value "tall"
execute if block ~ ~ ~ #blockstate_f:all[up=true] run data modify storage blockstate_f: BlockState.Properties.up set value "true"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=true] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "true"
execute if block ~ ~ ~ #blockstate_f:all[west=none] run data modify storage blockstate_f: BlockState.Properties.west set value "none"
execute if block ~ ~ ~ #blockstate_f:all[west=tall] run data modify storage blockstate_f: BlockState.Properties.west set value "tall"