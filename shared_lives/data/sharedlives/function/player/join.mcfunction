# Shared Lives - 플레이어 접속/재접속 처리 (as 플레이어)
scoreboard players set @s sl_leave 0
scoreboard players set @s sl_join 1
execute if score #gameover sl_data matches 1 run tellraw @s [{text:"[Shared Lives] ",color:"gold",bold:true},{text:"이 월드는 게임 오버 상태입니다. 관리자가 초기화할 때까지 관전자 모드로 플레이합니다.",color:"red"}]
execute if score #gameover sl_data matches 0 run tellraw @s [{text:"[Shared Lives] ",color:"gold",bold:true},{text:"모든 플레이어가 목숨을 공유합니다. 남은 공유 목숨: ",color:"white"},{score:{name:"#lives",objective:"sl_data"},color:"aqua",bold:true},{text:" / ",color:"gray"},{score:{name:"#max_lives",objective:"sl_data"},color:"gray"}]
