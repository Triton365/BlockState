data modify storage blockstate_f: BlockState set value {Name:"minecraft:nether_portal"}
execute if block ~ ~ ~ #blockstate_f:all[axis=x] run data modify storage blockstate_f: BlockState.Properties.axis set value "x"
execute if block ~ ~ ~ #blockstate_f:all[axis=z] run data modify storage blockstate_f: BlockState.Properties.axis set value "z"