data modify storage blockstate_f: BlockState set value {Name:"minecraft:repeater",Properties:{delay:"1",facing:"east",locked:"false",powered:"false"}}
execute if block ~ ~ ~ #blockstate_f:all[delay=2] run data modify storage blockstate_f: BlockState.Properties.delay set value "2"
execute if block ~ ~ ~ #blockstate_f:all[delay=3] run data modify storage blockstate_f: BlockState.Properties.delay set value "3"
execute if block ~ ~ ~ #blockstate_f:all[delay=4] run data modify storage blockstate_f: BlockState.Properties.delay set value "4"
execute if block ~ ~ ~ #blockstate_f:all[facing=north] run data modify storage blockstate_f: BlockState.Properties.facing set value "north"
execute if block ~ ~ ~ #blockstate_f:all[facing=south] run data modify storage blockstate_f: BlockState.Properties.facing set value "south"
execute if block ~ ~ ~ #blockstate_f:all[facing=west] run data modify storage blockstate_f: BlockState.Properties.facing set value "west"
execute if block ~ ~ ~ #blockstate_f:all[locked=true] run data modify storage blockstate_f: BlockState.Properties.locked set value "true"
execute if block ~ ~ ~ #blockstate_f:all[powered=true] run data modify storage blockstate_f: BlockState.Properties.powered set value "true"