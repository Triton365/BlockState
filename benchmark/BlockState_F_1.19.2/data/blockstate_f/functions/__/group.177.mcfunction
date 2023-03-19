execute if block ~ ~ ~ moss_block run data modify storage blockstate_f: BlockState set value {Name:"minecraft:moss_block"}
execute if block ~ ~ ~ moss_carpet run data modify storage blockstate_f: BlockState set value {Name:"minecraft:moss_carpet"}
execute if block ~ ~ ~ mossy_cobblestone run data modify storage blockstate_f: BlockState set value {Name:"minecraft:mossy_cobblestone"}
execute if block ~ ~ ~ mossy_cobblestone_slab run function blockstate_f:__/block.mossy_cobblestone_slab