execute if block ~ ~ ~ basalt run function blockstate_f:__/block.basalt
execute if block ~ ~ ~ beacon run data modify storage blockstate_f: BlockState set value {Name:"minecraft:beacon"}
execute if block ~ ~ ~ bedrock run data modify storage blockstate_f: BlockState set value {Name:"minecraft:bedrock"}
execute if block ~ ~ ~ bee_nest run function blockstate_f:__/block.bee_nest