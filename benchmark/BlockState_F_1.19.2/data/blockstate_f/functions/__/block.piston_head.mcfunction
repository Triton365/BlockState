data modify storage blockstate_f: BlockState set value {Name:"minecraft:piston_head",Properties:{type:"normal",facing:"down",short:"false"}}
execute if block ~ ~ ~ #blockstate_f:all[type=sticky] run data modify storage blockstate_f: BlockState.Properties.type set value "sticky"
execute if block ~ ~ ~ #blockstate_f:all[facing=east] run data modify storage blockstate_f: BlockState.Properties.facing set value "east"
execute if block ~ ~ ~ #blockstate_f:all[facing=north] run data modify storage blockstate_f: BlockState.Properties.facing set value "north"
execute if block ~ ~ ~ #blockstate_f:all[facing=south] run data modify storage blockstate_f: BlockState.Properties.facing set value "south"
execute if block ~ ~ ~ #blockstate_f:all[facing=up] run data modify storage blockstate_f: BlockState.Properties.facing set value "up"
execute if block ~ ~ ~ #blockstate_f:all[facing=west] run data modify storage blockstate_f: BlockState.Properties.facing set value "west"
execute if block ~ ~ ~ #blockstate_f:all[short=true] run data modify storage blockstate_f: BlockState.Properties.short set value "true"