# BlockState
호출된 곳에 위치한 블록의 BlockState 값을 추출하는 루트테이블을 제공합니다.   
현재 JE 1.19.2 기준이며, 후술할 `generator.py` 파일을 이용해 다른 버전으로도 *아마* 변환이 가능합니다.   
<br>

## 사용법
`loot` 명령어로 `blockstate:get` 루트테이블을 호출합니다.   
그러면 호출한 위치에 있던 블록이 `BlockState` 형태로 바뀌어,   
루트테이블이 반환하는 아이템의 `tag` 내부로 들어갑니다.   
<br>
아래는 간단한 테스트용 예제입니다. 발 밑 블록의 `BlockState`를 추출합니다.   
```mcfunction
execute at @s positioned ~ ~-0.1 ~ run loot replace entity @s weapon loot blockstate:get
data get entity @s SelectedItem.tag
```
<br>

## 반환
반환하는 아이템의 `tag` 내부는 보통 다음 구조로 이루어져 있습니다.   
상태가 완전히 없는 블록의 경우 `Properties` 태그는 생략됩니다.
```
{Name:"minecraft:...",Properties:{...}}
```
참고로 개별적인 상태 하나하나는 기본값을 가지더라도 생략되지 않습니다.   
예를 들어, `snowy` 상태가 `false`인 잔디블록은 `snowy` 상태를 생략할 수 있으나,      
반환되는 아이템은 반드시 `Properties`에 `snowy:"false"`를 포함합니다.   
<br>
또한, `tag`가 생략된 아이템을 반환하는 예외도 존재합니다.   
구체적으로는 아마 다음과 같은 경우일 것으로 추측됩니다.
- 주어진 위치의 청크가 언로드되어 있는 경우
- 최대 높이 초과 또는 최저 높이 미만 영역에 있는 경우
- 다른 버전 혹은 다른 모드에서 등장하는 블록인 경우
<br><br><br>

## generator.py
`generator.py` 파일은 그 옆에있는 `data.min.json` 파일의 데이터를 분석하여   
`loot_tables` 폴더 안에 있는 수많은 루트테이블을 자동 생성해주는 스크립트입니다.   
1.19 이외의 버전, 예를 들어 1.20 버전이 업데이트 되더라도   
`data.min.json` 파일 하나만 바꿔서 돌리면 사용할 수 있기 위한 목적입니다.   
<br>
최신버전의 `data.min.json` 파일은 아래 링크에서 구할 수 있습니다.   
https://github.com/Arcensoth/mcdata/blob/master/processed/reports/blocks/simplified/data.min.json   
History를 열면 다른 버전도 구할 수 있을 겁니다.   
<br>
다만, 버전 간 루트테이블 구조에 차이가 있다면 코드를 변경해야 하니   
이 점은 다른 대책이 필요해 보입니다.   