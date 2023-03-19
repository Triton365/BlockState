data modify storage blockstate_f: BlockState set value {Name:"minecraft:sculk_shrieker"}
execute if block ~ ~ ~ #blockstate_f:all[can_summon=false] run data modify storage blockstate_f: BlockState.Properties.can_summon set value "false"
execute if block ~ ~ ~ #blockstate_f:all[can_summon=true] run data modify storage blockstate_f: BlockState.Properties.can_summon set value "true"
execute if block ~ ~ ~ #blockstate_f:all[shrieking=false] run data modify storage blockstate_f: BlockState.Properties.shrieking set value "false"
execute if block ~ ~ ~ #blockstate_f:all[shrieking=true] run data modify storage blockstate_f: BlockState.Properties.shrieking set value "true"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=false] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "false"
execute if block ~ ~ ~ #blockstate_f:all[waterlogged=true] run data modify storage blockstate_f: BlockState.Properties.waterlogged set value "true"