# Shared Lives - 플레이어 1명을 관전자로 전환 (as 플레이어)
gamemode spectator @s
scoreboard players set @s sl_forced 1
title @s times 10 100 20
title @s subtitle {text:"공유 목숨이 모두 소진되었습니다",color:"red"}
title @s title {text:"GAME OVER",color:"dark_red",bold:true}
execute at @s run playsound minecraft:entity.wither.spawn master @s ~ ~ ~ 1 0.7
