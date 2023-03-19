data remove storage blockstate_benchmark: BlockState
execute positioned ~ ~-.5 ~ run loot replace entity 0-0-0-0-0 weapon loot blockstate:get
data modify storage blockstate_benchmark: BlockState set from entity 0-0-0-0-0 HandItems[0].tag