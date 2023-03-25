data modify storage blockstate_f: BlockState set value {Name:"minecraft:red_mushroom_block",Properties:{down:"false",east:"false",north:"false",south:"false",up:"false",west:"false"}}
execute if block ~ ~ ~ #blockstate_f:all[down=true] run data modify storage blockstate_f: BlockState.Properties.down set value "true"
execute if block ~ ~ ~ #blockstate_f:all[east=true] run data modify storage blockstate_f: BlockState.Properties.east set value "true"
execute if block ~ ~ ~ #blockstate_f:all[north=true] run data modify storage blockstate_f: BlockState.Properties.north set value "true"
execute if block ~ ~ ~ #blockstate_f:all[south=true] run data modify storage blockstate_f: BlockState.Properties.south set value "true"
execute if block ~ ~ ~ #blockstate_f:all[up=true] run data modify storage blockstate_f: BlockState.Properties.up set value "true"
execute if block ~ ~ ~ #blockstate_f:all[west=true] run data modify storage blockstate_f: BlockState.Properties.west set value "true"