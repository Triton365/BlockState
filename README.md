<img src="https://user-images.githubusercontent.com/93764565/224527804-182f2369-8739-428b-8d2c-56ed234983e0.gif" width="682"><br>
<br>
[한국어(Korean)](https://github.com/Triton365/BlockState/blob/main/README_KR.md)<br>

# BlockState
This pack provides a giant loot table that extracts the blockstate data of the block at the called location.

In commands, there are two vanilla tricks to get the blockstate data: summoning an arrow to get its `inBlockState` nbt, or using the `/loot ... mine` command to drop the block as item. However, both have some drawbacks. The arrow method takes 1 tick and doesn't work for blocks that don't have collision, and the loot mine method breaks when other datapacks change the vanilla loot tables, and even there are some blocks that don't/can't have their loot table. The only (near-)perfect way to do this is to hardcode all blocks and states, as is currently done in this pack.

This pack gets blockstate data using a really big binary search tree with all blocks and states hardcoded. The tree itself is based on a loot table, but it does not rely on or change the vanilla loot tables.

<br><br>

## Download
- JE 1.21.6: <https://github.com/Triton365/BlockState/releases/download/v1.0.3/BlockState_1.21.6.zip>


For older versions, see [Releases](https://github.com/Triton365/BlockState/releases).

You can preview the contents of this pack at [datapack-preview branch](https://github.com/Triton365/BlockState/tree/datapack-preview).
<br><br><br>

## Usage
Run the `blockstate:get` loot table (with `/loot` command) **at** the block you want to extract the blockstate from.<br>
For example, to print the blockstate data of the block `@s` is stepping on,<br>
```mcfunction
summon item_display ~ ~ ~ {UUID:[I;0,0,0,0]}
execute at @s positioned ~ ~-0.1 ~ run loot replace entity 0-0-0-0-0 contents loot blockstate:get
tellraw @a {"nbt":"item.components.minecraft:custom_data","entity":"0-0-0-0-0"}
kill 0-0-0-0-0
```
The returned item's `minecraft:custom_data` component itself is the blockstate data, and usually structured like this:<br>
```
"minecraft:custom_data":{Name:"minecraft:...",Properties:{...}}
```
Each states won't be omitted even though they have default values. For example, a grass block whose `snowy` state is `false` can omit the `snowy` state, but the returned item will always contain `snowy:"false"` in its `Properties`.<br>
In the case of a block that has no state at all, `Properties` tag is omitted. And in the following situations, an item without any component can appear.
- If the chunk of the current position is unloaded
- If called from a position higher than the maximum height or lower than the minimum height
- If the current block is from higher versions or mods
<br><br><br>

## Precautions when applying to the falling_block
- Unloaded chunk, out of build range, blocks from higher versions/mods will make this loot table return an item with no components.
- [MC-220091](https://bugs.mojang.com/browse/MC-220091): Falling blocks cannot be any air block, it will forcibly changed to default sand. (`air`,`cave_air`,`void_air`)
- [MC-64634](https://bugs.mojang.com/browse/MC-64634): Blocks without block model are invisible.
- [MC-72849](https://bugs.mojang.com/browse/MC-72849): Changing the `BlockState` of a falling_block with the `/data` command does not reflect it visually. You can bypass it by summoning a falling_block to a distant location like (29999999, 0, 0), changing the `BlockState` there, and then tp-ing the falling block to the desired location.
- A `moving_piston` block which can appear when the piston extends/retracts needs to be converted by getting the `blockState` nbt of that `moving_piston`.
<br><br><br>

## Precautions when applying to the block_display
- Unloaded chunk, out of build range, blocks from higher versions/mods will make this loot table return an item with no components.
- [MC-259990](https://bugs.mojang.com/browse/MC-259990): block display entities are invisible when `block_state` is head, banner, sign or bell.
- [MC-259954](https://bugs.mojang.com/browse/MC-259954): Some blocks (bed/chest/conduit/enderchest/shulkerbox) are processed as item renders, so they ignore their `Properties` data.
- A `moving_piston` block which can appear when the piston extends/retracts needs to be converted by getting the `blockState` nbt of that `moving_piston`.
<br><br><br>

## blockstate_datapack_generator.py
The `blockstate_datapack_generator.py` is a python script that automatically creates this datapack when you give it a version. Simply open the file, change the value of the `VERSION` variable, and run it. Then the script will create a block list corresponding to that version with [Data Generator](https://minecraft.wiki/w/Tutorial:Running_the_data_generator), and then automatically create a binary search loot table based on that list.<br>
It was created to eliminate maintenance work as much as possible, but even so, there's still a downside that the codes need to be updated whenever the loot table structure changes.<br>
<br><br>

## Benchmark
~~As a result of comparison with the method using the function tree, it was concluded that the loot table method is faster.~~<br>
I'm not sure if this is true now, I haven't checked to see what happened to performance as the game moved to the component structure.<br>
<https://github.com/Triton365/BlockState/blob/main/benchmark/BENCHMARK.md><br>
<br><br>
