data modify storage blockstate_f: BlockState set value {Name:"minecraft:bell",Properties:{attachment:"ceiling",facing:"east",powered:"false"}}
execute if block ~ ~ ~ #blockstate_f:all[attachment=double_wall] run data modify storage blockstate_f: BlockState.Properties.attachment set value "double_wall"
execute if block ~ ~ ~ #blockstate_f:all[attachment=floor] run data modify storage blockstate_f: BlockState.Properties.attachment set value "floor"
execute if block ~ ~ ~ #blockstate_f:all[attachment=single_wall] run data modify storage blockstate_f: BlockState.Properties.attachment set value "single_wall"
execute if block ~ ~ ~ #blockstate_f:all[facing=north] run data modify storage blockstate_f: BlockState.Properties.facing set value "north"
execute if block ~ ~ ~ #blockstate_f:all[facing=south] run data modify storage blockstate_f: BlockState.Properties.facing set value "south"
execute if block ~ ~ ~ #blockstate_f:all[facing=west] run data modify storage blockstate_f: BlockState.Properties.facing set value "west"
execute if block ~ ~ ~ #blockstate_f:all[powered=true] run data modify storage blockstate_f: BlockState.Properties.powered set value "true"