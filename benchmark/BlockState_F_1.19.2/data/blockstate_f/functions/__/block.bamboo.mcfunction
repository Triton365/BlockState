data modify storage blockstate_f: BlockState set value {Name:"minecraft:bamboo",Properties:{age:"0",leaves:"large",stage:"0"}}
execute if block ~ ~ ~ #blockstate_f:all[age=1] run data modify storage blockstate_f: BlockState.Properties.age set value "1"
execute if block ~ ~ ~ #blockstate_f:all[leaves=none] run data modify storage blockstate_f: BlockState.Properties.leaves set value "none"
execute if block ~ ~ ~ #blockstate_f:all[leaves=small] run data modify storage blockstate_f: BlockState.Properties.leaves set value "small"
execute if block ~ ~ ~ #blockstate_f:all[stage=1] run data modify storage blockstate_f: BlockState.Properties.stage set value "1"