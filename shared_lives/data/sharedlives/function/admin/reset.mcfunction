# Shared Lives - 게임 초기화: 목숨 = 기본값, 게임오버 해제, 사망 기록 삭제, 강제 관전자 복귀
scoreboard players operation #lives sl_data = #max_lives sl_data
scoreboard players set #gameover sl_data 0
scoreboard players reset * sl_deaths
scoreboard players set #timer sl_data 20
title @a clear
execute as @a[scores={sl_forced=1}] run function sharedlives:player/restore
tellraw @a [{text:"[Shared Lives] ",color:"gold",bold:true},{text:"게임이 초기화되었습니다! 새 게임 시작. 공유 목숨: ",color:"green",bold:true},{score:{name:"#lives",objective:"sl_data"},color:"aqua",bold:true},{text:" / ",color:"gray"},{score:{name:"#max_lives",objective:"sl_data"},color:"gray"}]
