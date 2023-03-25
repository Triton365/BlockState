data modify storage blockstate_f: BlockState set value {Name:"minecraft:tripwire",Properties:{attached:"false",disarmed:"false",east:"false",north:"false",powered:"false",south:"false",west:"false"}}
execute if block ~ ~ ~ #blockstate_f:all[attached=true] run data modify storage blockstate_f: BlockState.Properties.attached set value "true"
execute if block ~ ~ ~ #blockstate_f:all[disarmed=true] run data modify storage blockstate_f: BlockState.Properties.disarmed set value "true"
execute if block ~ ~ ~ #blockstate_f:all[east=true] run data modify storage blockstate_f: BlockState.Properties.east set value "true"
execute if block ~ ~ ~ #blockstate_f:all[north=true] run data modify storage blockstate_f: BlockState.Properties.north set value "true"
execute if block ~ ~ ~ #blockstate_f:all[powered=true] run data modify storage blockstate_f: BlockState.Properties.powered set value "true"
execute if block ~ ~ ~ #blockstate_f:all[south=true] run data modify storage blockstate_f: BlockState.Properties.south set value "true"
execute if block ~ ~ ~ #blockstate_f:all[west=true] run data modify storage blockstate_f: BlockState.Properties.west set value "true"