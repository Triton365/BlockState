<img src="https://user-images.githubusercontent.com/93764565/224527804-182f2369-8739-428b-8d2c-56ed234983e0.gif" width="682"><br>
<br>
[한국어(Korean)](https://github.com/Triton365/BlockState/blob/main/README_KR.md)<br>

# BlockState
This pack provides a giant loot-table that extracts the BlockState data of the block at the called location. It **does not modify** the vanilla loot, instead it mainly uses binary search to get the correct block.<br>
<br><br>

## Download
- JE 1.19.2: <https://github.com/Triton365/BlockState/releases/download/v1.0.0/BlockState_1.19.2.zip>
- JE 1.19.3: <https://github.com/Triton365/BlockState/releases/download/v1.0.0/BlockState_1.19.3.zip>
- JE 1.19.4: <https://github.com/Triton365/BlockState/releases/download/v1.0.0/BlockState_1.19.4.zip>
- JE 1.20&nbsp;&nbsp;: <https://github.com/Triton365/BlockState/releases/download/v1.0.0/BlockState_1.20.zip>
- JE 1.20.1: ↑ (no change)
- JE 1.20.2: <https://github.com/Triton365/BlockState/releases/download/v1.0.1/BlockState_1.20.2.zip>
- JE 1.20.3: <https://github.com/Triton365/BlockState/releases/download/v1.0.1/BlockState_1.20.3.zip>
- JE 1.20.4: ↑ (no change)
- JE 1.20.5: <https://github.com/Triton365/BlockState/releases/download/v1.0.2/BlockState_1.20.5.zip>
- JE 1.20.6: ↑ (no change)
- JE 1.21&nbsp;&nbsp;: <https://github.com/Triton365/BlockState/releases/download/v1.0.3/BlockState_1.21.zip>


You can preview the contents of this pack at [datapack-preview branch](https://github.com/Triton365/BlockState/tree/datapack-preview).
<br><br><br>

## Usage
Call the `blockstate:get` loot-table (with `/loot` command) **at** the block you want to extract the BlockState from.<br>
Below code is an example that prints the BlockState of the block underfoot.<br>
```mcfunction
summon armor_stand ~ ~ ~ {UUID:[I;0,0,0,0],Invulnerable:1b,NoGravity:1b}
execute at @s positioned ~ ~-0.1 ~ run loot replace entity 0-0-0-0-0 weapon loot blockstate:get
tellraw @a {"nbt":"HandItems[0].components.minecraft:custom_data","entity":"0-0-0-0-0"}
kill 0-0-0-0-0
```
The returned item's `minecraft:custom_data` itself is the BlockState data, usually structured like this:<br>
```
"minecraft:custom_data":{Name:"minecraft:...",Properties:{...}}
```
Each states won't be omitted even though they have default values. For example, a grass block whose `snowy` state is `false` can omit the `snowy` state, but the returned item will always contain `snowy:"false"` in its `Properties`.<br>
In the case of a block that has no state at all, the `Properties` tag is omitted. And in the following situations, an item without a tag may appear.
- If the chunk of the called location is unloaded
- If called in an area above the maximum height or below the minimum height
- Blocks appearing in other versions or other mods
<br><br><br>

## Precautions when applying to the falling_block
- Unloaded chunk, out of build range, higher version block, or mod block will make the loot-table return an item with no tag present.
- Falling blocks cannot be `air`, it will forcibly changed to default sand.
- [MC-64634](https://bugs.mojang.com/browse/MC-64634): Blocks without block model are invisible.
- [MC-72849](https://bugs.mojang.com/browse/MC-72849): Changing the `BlockState` of a falling_block with the `/data` command does not reflect it visually. You can bypass it by summoning a falling_block to a distant location like (29999999, 0, 0), changing the `BlockState` there, and then tp-ing the falling block to the desired location.
- A `moving_piston` block which can appear when the piston moves needs to be converted by getting the nbt `blockState` of that `moving_piston`.
<br><br><br>

## Precautions when applying to the block_display
- Unloaded chunk, out of build range, higher version block, or mod block will make the loot-table return an item with no tag present.
- [MC-259990](https://bugs.mojang.com/browse/MC-259990): block display entities are invisible when `block_state` is head, banner, sign or bell.
- [MC-259954](https://bugs.mojang.com/browse/MC-259954): Some blocks (bed/chest/conduit/enderchest/shulkerbox) are processed as item renders, so they lose their `Properties` data.
- A `moving_piston` block which can appear when the piston moves needs to be converted by getting the nbt `blockState` of that `moving_piston`.
<br><br><br>

## blockstate_datapack_generator.py
The `blockstate_datapack_generator.py` is a python script that automatically creates this datapack when you give it a version. Simply open the file, change the value of the `VERSION` variable to the desired value, and run it. Then, this script creates a block list corresponding to that version with [Data Generator](https://minecraft.fandom.com/wiki/Tutorials/Running_the_data_generator), and then automatically creates a binary search loot-table based on that list.<br>
It was created to eliminate maintenance work as much as possible, but even so, there's still a downside that the code needs to be modified whenever the loot-table structure changes due to an update.<br>
<br><br>

## Benchmark
~~As a result of comparison with the method using the function tree, it was concluded that the loot-table method is faster.~~<br>
I'm not sure if this is true now, I haven't checked to see what happened to performance as the game moved to the component structure.<br>
<https://github.com/Triton365/BlockState/blob/main/benchmark/BENCHMARK.md><br>
<br><br>
