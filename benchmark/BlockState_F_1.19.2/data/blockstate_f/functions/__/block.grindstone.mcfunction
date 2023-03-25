data modify storage blockstate_f: BlockState set value {Name:"minecraft:grindstone",Properties:{face:"ceiling",facing:"east"}}
execute if block ~ ~ ~ #blockstate_f:all[face=floor] run data modify storage blockstate_f: BlockState.Properties.face set value "floor"
execute if block ~ ~ ~ #blockstate_f:all[face=wall] run data modify storage blockstate_f: BlockState.Properties.face set value "wall"
execute if block ~ ~ ~ #blockstate_f:all[facing=north] run data modify storage blockstate_f: BlockState.Properties.facing set value "north"
execute if block ~ ~ ~ #blockstate_f:all[facing=south] run data modify storage blockstate_f: BlockState.Properties.facing set value "south"
execute if block ~ ~ ~ #blockstate_f:all[facing=west] run data modify storage blockstate_f: BlockState.Properties.facing set value "west"