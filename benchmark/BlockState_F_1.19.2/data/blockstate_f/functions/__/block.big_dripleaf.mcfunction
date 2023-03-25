data modify storage blockstate_f: BlockState set value {Name:"minecraft:big_dripleaf",Properties:{facing:"east",tilt:"full",waterlogged:"false"}}
execute if block ~ ~ ~ #blockstate_f:all[facing=north] run data modify storage blockstate_f: BlockState.Properties.facing set value "north"
execute if block ~ ~ ~ #blockstate_f:all[facing=south] run data modify storage blockstate_f: BlockState.Properties.facing set value "south"
execute if block ~ ~ ~ #blockstate_f:all[facing=west] run data modify storage blockstate_f: BlockState.Properties.facing set value "west"
execute if block ~ ~ ~ #blockstate_f:all[tilt=none] run data modify storage blockstate_f: BlockState.Properties.tilt set value "none"
execute if block ~ ~ ~ #blockstate_f:all[tilt=partial] run data modify storage blockstate_f: BlockState.Properties.tilt set value "partial"
execute if block ~ ~ ~ #blockstate_f:all[tilt=unstable] run data modify storage blockstate_f: BlockState.Properties.tilt set value "unstable"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=true] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "true"