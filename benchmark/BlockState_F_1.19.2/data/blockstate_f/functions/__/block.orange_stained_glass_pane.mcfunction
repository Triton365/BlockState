data modify storage blockstate_f: BlockState set value {Name:"minecraft:orange_stained_glass_pane",Properties:{east:"false",north:"false",south:"false",waterlogged:"false",west:"false"}}
execute if block ~ ~ ~ #blockstate_f:all[east=true] run data modify storage blockstate_f: BlockState.Properties.east set value "true"
execute if block ~ ~ ~ #blockstate_f:all[north=true] run data modify storage blockstate_f: BlockState.Properties.north set value "true"
execute if block ~ ~ ~ #blockstate_f:all[south=true] run data modify storage blockstate_f: BlockState.Properties.south set value "true"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=true] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "true"
execute if block ~ ~ ~ #blockstate_f:all[west=true] run data modify storage blockstate_f: BlockState.Properties.west set value "true"