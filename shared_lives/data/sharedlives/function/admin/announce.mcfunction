# Shared Lives - 현재 상태를 전체 공지
tellraw @a [{text:"[Shared Lives] ",color:"gold",bold:true},{text:"남은 공유 목숨: ",color:"white"},{score:{name:"#lives",objective:"sl_data"},color:"aqua",bold:true},{text:" / ",color:"gray"},{score:{name:"#max_lives",objective:"sl_data"},color:"gray"},{text:" (기본 목숨)",color:"dark_gray"}]
execute if score #gameover sl_data matches 1 run tellraw @a [{text:"[Shared Lives] ",color:"gold",bold:true},{text:"상태: 게임 오버 (전원 관전자)",color:"red"}]
execute if score #gameover sl_data matches 0 run tellraw @a [{text:"[Shared Lives] ",color:"gold",bold:true},{text:"상태: 진행 중",color:"green"}]
