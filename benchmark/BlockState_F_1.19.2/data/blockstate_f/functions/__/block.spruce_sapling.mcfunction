data modify storage blockstate_f: BlockState set value {Name:"minecraft:spruce_sapling",Properties:{stage:"0"}}
execute if block ~ ~ ~ #blockstate_f:all[stage=1] run data modify storage blockstate_f: BlockState.Properties.stage set value "1"