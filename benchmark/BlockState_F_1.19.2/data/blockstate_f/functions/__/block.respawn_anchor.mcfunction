data modify storage blockstate_f: BlockState set value {Name:"minecraft:respawn_anchor",Properties:{charges:"0"}}
execute if block ~ ~ ~ #blockstate_f:all[charges=1] run data modify storage blockstate_f: BlockState.Properties.charges set value "1"
execute if block ~ ~ ~ #blockstate_f:all[charges=2] run data modify storage blockstate_f: BlockState.Properties.charges set value "2"
execute if block ~ ~ ~ #blockstate_f:all[charges=3] run data modify storage blockstate_f: BlockState.Properties.charges set value "3"
execute if block ~ ~ ~ #blockstate_f:all[charges=4] run data modify storage blockstate_f: BlockState.Properties.charges set value "4"