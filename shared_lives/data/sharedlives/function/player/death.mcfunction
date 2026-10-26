# Shared Lives - 플레이어 사망 처리 (as 사망한 플레이어)
# 중복 감지 방지: 사망 점수를 먼저 0으로 되돌림
scoreboard players set @s sl_deaths 0
# 같은 틱에 다른 플레이어의 사망으로 이미 게임오버가 되었으면 중단
execute if score #gameover sl_data matches 1 run return 0
# 공유 목숨 1 감소 (0 미만 방지)
scoreboard players remove #lives sl_data 1
execute if score #lives sl_data matches ..0 run scoreboard players set #lives sl_data 0
tellraw @a [{text:"[Shared Lives] ",color:"gold",bold:true},{selector:"@s",color:"yellow"},{text:" 님이 사망했습니다. 남은 공유 목숨: ",color:"white"},{score:{name:"#lives",objective:"sl_data"},color:"red",bold:true},{text:" / ",color:"gray"},{score:{name:"#max_lives",objective:"sl_data"},color:"gray"}]
execute if score #lives sl_data matches 1.. run title @a times 5 40 10
execute if score #lives sl_data matches 1.. run title @a subtitle [{text:"남은 공유 목숨: ",color:"gray"},{score:{name:"#lives",objective:"sl_data"},color:"red",bold:true}]
execute if score #lives sl_data matches 1.. run title @a title {text:"공유 목숨 -1",color:"red"}
execute if score #lives sl_data matches 1.. as @a at @s run playsound minecraft:block.anvil.land master @s ~ ~ ~ 0.6 0.5
# 액션바 즉시 갱신 및 게임오버 판정
scoreboard players set #timer sl_data 20
function sharedlives:game/check
