# Shared Lives - 월드 로드 / 서버 시작 / reload 시 1회 실행 (#minecraft:load)
# 스코어보드 목표 생성 (이미 있으면 조용히 실패)
scoreboard objectives add sl_deaths deathCount
scoreboard objectives add sl_leave minecraft.custom:minecraft.leave_game
scoreboard objectives add sl_join dummy
scoreboard objectives add sl_forced dummy
scoreboard objectives add sl_data dummy
# 최초 설치 시에만 기본값 설정 (기존 진행 상태는 보존)
execute unless score #installed sl_data matches 1 run function sharedlives:install
scoreboard players set #version sl_data 1
