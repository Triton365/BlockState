data modify storage blockstate_f: BlockState set value {Name:"minecraft:redstone_lamp",Properties:{lit:"false"}}
execute if block ~ ~ ~ #blockstate_f:all[lit=true] run data modify storage blockstate_f: BlockState.Properties.lit set value "true"