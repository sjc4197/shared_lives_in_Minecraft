# Shared Lives - 매 틱 실행 (#minecraft:tick)
# 0. 설정이 사라진 경우(목표 삭제 등) 자동 복구
execute unless score #installed sl_data matches 1 run function sharedlives:install
# 1. 신규 접속 / 재접속 처리
execute as @a unless score @s sl_join = @s sl_join run function sharedlives:player/join
execute as @a[scores={sl_leave=1..}] run function sharedlives:player/join
# 2. 사망 감지 (게임오버가 아닐 때만, 사망 점수는 처리 직후 0으로 되돌려 중복 감지 방지)
execute if score #gameover sl_data matches 0 as @a[scores={sl_deaths=1..}] run function sharedlives:player/death
# 3. 상태 점검 (목숨 0 -> 게임오버, 게임오버 중 목숨 1 이상 -> 재개)
function sharedlives:game/check
# 4. 게임오버 유지: 재접속/리스폰/모드 변경과 관계없이 전원 관전자 강제
execute if score #gameover sl_data matches 1 run function sharedlives:game/enforce
# 5. 게임오버 해제 후, 이 데이터팩이 관전자로 강제했던 플레이어를 복귀 (오프라인이었다가 접속한 경우 포함)
execute if score #gameover sl_data matches 0 as @a[scores={sl_forced=1}] run function sharedlives:player/restore
# 6. 액션바 갱신 (1초마다)
scoreboard players add #timer sl_data 1
execute if score #timer sl_data matches 20.. run function sharedlives:display/refresh
