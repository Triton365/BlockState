data modify storage blockstate_f: BlockState set value {Name:"minecraft:beehive",Properties:{facing:"east",honey_level:"0"}}
execute if block ~ ~ ~ #blockstate_f:all[facing=north] run data modify storage blockstate_f: BlockState.Properties.facing set value "north"
execute if block ~ ~ ~ #blockstate_f:all[facing=south] run data modify storage blockstate_f: BlockState.Properties.facing set value "south"
execute if block ~ ~ ~ #blockstate_f:all[facing=west] run data modify storage blockstate_f: BlockState.Properties.facing set value "west"
execute if block ~ ~ ~ #blockstate_f:all[honey_level=1] run data modify storage blockstate_f: BlockState.Properties.honey_level set value "1"
execute if block ~ ~ ~ #blockstate_f:all[honey_level=2] run data modify storage blockstate_f: BlockState.Properties.honey_level set value "2"
execute if block ~ ~ ~ #blockstate_f:all[honey_level=3] run data modify storage blockstate_f: BlockState.Properties.honey_level set value "3"
execute if block ~ ~ ~ #blockstate_f:all[honey_level=4] run data modify storage blockstate_f: BlockState.Properties.honey_level set value "4"
execute if block ~ ~ ~ #blockstate_f:all[honey_level=5] run data modify storage blockstate_f: BlockState.Properties.honey_level set value "5"