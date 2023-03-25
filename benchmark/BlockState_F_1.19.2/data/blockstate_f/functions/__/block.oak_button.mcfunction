data modify storage blockstate_f: BlockState set value {Name:"minecraft:oak_button",Properties:{face:"ceiling",facing:"east",powered:"false"}}
execute if block ~ ~ ~ #blockstate_f:all[face=floor] run data modify storage blockstate_f: BlockState.Properties.face set value "floor"
execute if block ~ ~ ~ #blockstate_f:all[face=wall] run data modify storage blockstate_f: BlockState.Properties.face set value "wall"
execute if block ~ ~ ~ #blockstate_f:all[facing=north] run data modify storage blockstate_f: BlockState.Properties.facing set value "north"
execute if block ~ ~ ~ #blockstate_f:all[facing=south] run data modify storage blockstate_f: BlockState.Properties.facing set value "south"
execute if block ~ ~ ~ #blockstate_f:all[facing=west] run data modify storage blockstate_f: BlockState.Properties.facing set value "west"
execute if block ~ ~ ~ #blockstate_f:all[powered=true] run data modify storage blockstate_f: BlockState.Properties.powered set value "true"