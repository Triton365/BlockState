<img src="https://user-images.githubusercontent.com/93764565/224527804-182f2369-8739-428b-8d2c-56ed234983e0.gif" width="682"><br>
<br>
[English(영어)](https://github.com/Triton365/BlockState)<br>

# BlockState
호출한 곳에 있는 블록의 BlockState 데이터를 추출하는 루트테이블입니다.

사실 커맨드에는 BlockState 데이터를 얻는 트릭이 두가지정도가 있긴 합니다. 화살을 소환하고 `inBlockState` 태그를 복사하는 방법이랑, 또는, `/loot ... mine` 커맨드를 이용해 블록을 아이템 형태로 드랍하는 방법이죠. 그러나 둘다 완벽한 방법은 아닙니다. 화살 방식은 1틱의 시간이 소요되며, 충돌 판정이 없어서 화살이 안꽂히는 블록에선 작동하지 못합니다. 그리고 loot mine 방식은 타 데이터팩이 바닐라 루트테이블을 바꿔버렸을때 고장날 수 있으며, 심지어 블록 중엔 루트테이블이 정의되지 않았거나 아예 정의될 수 없는 블록들도 있습니다. 유일하게 완벽에 가까운 방법은 모든 블록과 그 모든 상태값을 전부 노가다하는 것입니다. 이 데이터팩처럼요.

이 팩은 모든 블록과 모든 상태값을 노가다한 아주 거대한 이진 탐색 트리를 통해 BlockState 데이터를 얻어냅니다. 트리 자체는 루트테이블에 기반을 두고 있긴 하지만, 바닐라 루트테이블에 의존하거나 바닐라 루트테이블을 변경하진 않습니다.

<br><br>

## 다운로드
- JE 1.21.2-1.21.3: <https://github.com/Triton365/BlockState/releases/download/v1.0.3/BlockState_1.21_2.zip>


이전 버전의 팩들은 [Releases](https://github.com/Triton365/BlockState/releases) 페이지에서 확인할 수 있습니다.

이 팩의 내부가 어떻게 생겼는지 [datapack-preview 브랜치](https://github.com/Triton365/BlockState/tree/datapack-preview)에서 확인할 수 있습니다.
<br><br><br>

## 루트테이블 사용법
`/loot` 명령어로 `blockstate:get` 루트테이블을 호출하여 주어진 위치에 있는 블록의 BlockState 데이터를 얻을 수 있습니다.<br>
아래는 간단한 테스트용 예제입니다. 발 밑 블록의 BlockState를 출력합니다.<br>
```mcfunction
summon item_display ~ ~ ~ {UUID:[I;0,0,0,0]}
execute at @s positioned ~ ~-0.1 ~ run loot replace entity 0-0-0-0-0 contents loot blockstate:get
tellraw @a {"nbt":"item.components.minecraft:custom_data","entity":"0-0-0-0-0"}
kill 0-0-0-0-0
```
루트테이블이 반환하는 아이템의 `minecraft:custom_data` 컴포넌트 자체가 BlockState 데이터입니다.<br>
보통은 다음과 같은 구조로 되어있습니다.<br>
```
"minecraft:custom_data":{Name:"minecraft:...",Properties:{...}}
```
추가로, 개별적인 상태 하나하나는 기본값을 가지더라도 생략되지 않습니다. 예를 들어 `snowy` 상태가 `false`인 잔디블록은 보통 `snowy` 상태를 생략할 수 있으나, 이 루트테이블에서 반환되는 아이템은 반드시 `Properties`에 `snowy:"false"`를 포함합니다.<br>
상태가 완전히 없는 블록의 경우 `Properties` 태그가 생략되기도 하며, 아래와 같은 상황에서는 `tag`가 존재하지 않는 아이템이 나오기도 합니다.
- 주어진 위치의 청크가 언로드되어 있는 경우
- 최대 높이 초과 또는 최저 높이 미만 영역에 있는 경우
- 다른 버전 혹은 다른 모드에서 등장하는 블록인 경우
<br><br><br>

## 폴링 블록(falling_block)에 적용시 주의사항
- 언로드된 청크, 건축 범위 밖, 상위 버전 블록, 모드 블록이 감지될 경우 루트테이블은 태그가 존재하지 않는 아이템을 반환합니다.
- 폴링블록에 공기(`air`)를 넣으면 기본값인 모래(`sand`)로 강제 변경됩니다.
- [MC-64634](https://bugs.mojang.com/browse/MC-64634): 블록 모델 파일이 없는 블록은 시각적으로 보이지 않습니다.
- [MC-72849](https://bugs.mojang.com/browse/MC-72849): /data 명령어로 폴링블록의 BlockState를 변경해도 시각적으로 반영되지 않습니다. 폴링블록을 먼 곳(29999999, 0, 0)에 소환한 뒤 그곳에서 BlockState를 변경, 그 다음에 폴링블록을 원하는 위치로 tp하는 식으로 우회할 수 있습니다.
- 피스톤이 움직일 때 발생하는 무빙 피스톤(`moving_piston`)은 해당 무빙 피스톤의 `blockState` 태그를 가져와서 변환해야 합니다.
<br><br><br>

## 블록 디스플레이(block_display)에 적용시 주의사항
- 언로드된 청크, 건축 범위 밖, 상위 버전 블록, 모드 블록이 감지될 경우 루트테이블은 태그가 존재하지 않는 아이템을 반환합니다.
- [MC-259990](https://bugs.mojang.com/browse/MC-259990): 블록 디스플레이에 머리, 현수막, 표지판, 종을 적용할 경우 시각적으로 보이지 않습니다.
- [MC-259954](https://bugs.mojang.com/browse/MC-259954): 몇몇 블록(침대/상자/전달체/엔더상자/셜커상자)은 아이템 렌더링으로 처리되기에 Properties 정보를 잃어버립니다.
- 피스톤이 움직일 때 발생하는 무빙 피스톤(`moving_piston`)은 해당 무빙 피스톤의 `blockState` 태그를 가져와서 변환해야 합니다.
<br><br><br>

## blockstate_datapack_generator.py
`blockstate_datapack_generator.py` 파일은 버전을 주면 이 데이터팩을 자동으로 생성해주는 파이썬 스크립트입니다. 간단하게 해당 파일을 열어서 VERSION 변수의 값을 원하는 값으로 변경한 뒤 실행하면 됩니다. 그러면 이 스크립트는 그 버전에 해당하는 블록 리스트를 [Data Generator](https://minecraft.fandom.com/wiki/Tutorials/Running_the_data_generator)로 생성한 뒤, 그 리스트를 기반으로 이진 탐색 루트테이블을 자동 생성합니다.<br>
유지보수가 최대한 필요없는 시스템을 고안한 것이지만, 그럼에도 버전 간 루트테이블 구조에 차이가 발생한다면 그때는 어쩔 수 없이 직접 코드를 수정해야 한다는 단점이 존재합니다.<br>
<br><br>

## 성능 비교
~~함수트리를 이용한 방식과 비교해본 결과 루트테이블이 더 빠르다는 결론이 나왔습니다.~~<br>
이게 지금도 빠를지는 모르겠습니다. 컴포넌트 구조로 업데이트된 이후로 아직 성능 테스트를 안해봤습니다.
<https://github.com/Triton365/BlockState/blob/main/benchmark/BENCHMARK.md><br>
<br><br>
