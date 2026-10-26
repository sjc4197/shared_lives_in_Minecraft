# Shared Lives - 게임오버 해제 (목숨이 1 이상으로 복구되었을 때)
scoreboard players set #gameover sl_data 0
scoreboard players set #timer sl_data 20
scoreboard players reset * sl_deaths
title @a clear
execute as @a[scores={sl_forced=1}] run function sharedlives:player/restore
tellraw @a [{text:"[Shared Lives] ",color:"gold",bold:true},{text:"게임이 재개되었습니다. 남은 공유 목숨: ",color:"green"},{score:{name:"#lives",objective:"sl_data"},color:"aqua",bold:true},{text:" / ",color:"gray"},{score:{name:"#max_lives",objective:"sl_data"},color:"gray"}]
