data modify storage blockstate_f: BlockState set value {Name:"minecraft:brewing_stand",Properties:{has_bottle_0:"false",has_bottle_1:"false",has_bottle_2:"false"}}
execute if block ~ ~ ~ #blockstate_f:all[has_bottle_0=true] run data modify storage blockstate_f: BlockState.Properties.has_bottle_0 set value "true"
execute if block ~ ~ ~ #blockstate_f:all[has_bottle_1=true] run data modify storage blockstate_f: BlockState.Properties.has_bottle_1 set value "true"
execute if block ~ ~ ~ #blockstate_f:all[has_bottle_2=true] run data modify storage blockstate_f: BlockState.Properties.has_bottle_2 set value "true"