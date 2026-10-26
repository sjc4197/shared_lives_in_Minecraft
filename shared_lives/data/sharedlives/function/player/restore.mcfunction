# Shared Lives - 게임오버 해제 후 강제 관전자 플레이어 복귀 (as 플레이어)
gamemode survival @s
scoreboard players reset @s sl_forced
tellraw @s [{text:"[Shared Lives] ",color:"gold",bold:true},{text:"게임이 초기화되어 생존 모드로 복귀했습니다.",color:"green"}]
