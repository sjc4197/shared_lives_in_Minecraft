# Shared Lives 데이터팩 (Minecraft Java Edition 26.3)

모든 플레이어가 **하나의 공유 목숨**을 사용하는 바닐라 데이터팩입니다.
누구든 사망하면 공유 목숨이 1 감소하고, 0이 되면 전체 게임오버가 되어 모든 플레이어가 관전자 모드로 전환됩니다.
모드나 외부 데이터팩 의존성 없이 동작하며, 싱글플레이와 멀티플레이(전용 서버) 모두 지원합니다.

| 항목 | 값 |
| --- | --- |
| 대상 버전 | Java Edition 26.3 (데이터팩 포맷 121.0) |
| pack.mcmeta | `min_format: [121, 0]`, `max_format: 121` |
| 네임스페이스 | `sharedlives` |
| 기본 공유 목숨 | 5 (관리자 변경 가능) |

---

## 1. 설치 방법

### 새 월드 / 기존 월드 공통 (싱글플레이)

1. `shared_lives.zip` 파일(또는 `shared_lives` 폴더)을 월드 폴더의 `datapacks` 폴더에 넣습니다.
   - Windows: `%APPDATA%\.minecraft\saves\<월드이름>\datapacks\`
2. 월드에 접속해 `/reload` 를 입력하거나, 월드를 다시 엽니다.
3. 채팅에 `/function sharedlives:admin/status` 를 입력해 **남은 공유 목숨: 5 / 5** 가 표시되면 설치 완료입니다.

새 월드를 만들 때는 월드 생성 화면의 **데이터 팩** 버튼에서 미리 추가할 수도 있습니다.

### 전용 서버 (멀티플레이)

1. 서버 폴더의 `<level-name>/datapacks/` 에 `shared_lives.zip` 을 넣습니다. (기본값은 `world/datapacks/`)
2. 서버를 재시작하거나 콘솔에서 `reload` 를 입력합니다.
3. 콘솔에 `datapack list` 를 입력해 `file/shared_lives.zip` 이 **enabled** 목록에 있는지 확인합니다.

### 기존 월드에 적용할 때

- 기존 플레이 진행도, 인벤토리, 다른 데이터팩의 데이터는 건드리지 않습니다.
- 이 데이터팩이 만드는 것은 스코어보드 목표 5개(`sl_deaths`, `sl_leave`, `sl_join`, `sl_forced`, `sl_data`)뿐이며 모두 `sl_` 접두사를 사용해 충돌을 피합니다.
- 사이드바/탭 목록 등 스코어보드 표시 슬롯은 사용하지 않습니다. 액션바만 사용하며, 다른 팩과 액션바가 겹치면 `/function sharedlives:admin/actionbar_off` 로 끌 수 있습니다.
- 처음 로드될 때만 기본값(목숨 5)이 설정되고, 이후 `/reload` 나 재시작을 해도 진행 상태는 유지됩니다.

---

## 2. 게임 규칙

- 모든 플레이어가 하나의 공유 목숨을 사용합니다. (기본 5개)
- 어떤 플레이어든 사망하면 공유 목숨이 1 감소하며, 전체 채팅과 타이틀로 알립니다.
- 남은 목숨은 액션바에 `❤ 공유 목숨 N / M` 으로 1초마다 갱신되어 표시됩니다. (3 이상 초록, 2 노랑, 1 이하 빨강)
- 공유 목숨이 0이 되면 **게임 오버**가 되어 모든 플레이어가 즉시 관전자 모드로 전환됩니다.
- 게임오버 상태는 **재접속, 리스폰, 신규 접속, 게임모드 변경**으로 해제되지 않습니다. 매 틱 관전자 모드가 강제되며, 게임오버 중 접속한 신규 플레이어도 관전자가 됩니다.
- 게임오버는 관리자가 `/function sharedlives:admin/reset` 으로 초기화하거나, 목숨을 1 이상으로 설정했을 때만 해제됩니다.

---

## 3. 관리자 명령어

OP 권한(레벨 2 이상)이 필요합니다. 게임 내 채팅에서는 앞에 `/` 를 붙이고, 서버 콘솔에서는 `/` 없이 입력합니다.
`/function sharedlives:admin/help` 를 입력하면 아래 목록이 채팅에 표시되며, 항목을 클릭하면 명령어가 채팅창에 입력됩니다.

| 명령어 | 설명 |
| --- | --- |
| `/function sharedlives:admin/help` | 명령어 목록 표시 |
| `/function sharedlives:admin/status` | 남은 목숨, 기본 목숨, 진행/게임오버 상태, 액션바 설정을 실행자에게 표시 |
| `/function sharedlives:admin/announce` | 현재 상태를 모든 플레이어에게 공지 |
| `/function sharedlives:admin/set {lives:5}` | 남은 공유 목숨을 지정한 값으로 설정. 0으로 설정하면 즉시 게임오버, 게임오버 중 1 이상으로 설정하면 게임 재개 |
| `/function sharedlives:admin/add {amount:1}` | 남은 공유 목숨 증가 (게임오버 중이면 재개) |
| `/function sharedlives:admin/remove {amount:1}` | 남은 공유 목숨 감소 (0이 되면 게임오버) |
| `/function sharedlives:admin/set_max {lives:5}` | **기본(최대) 목숨** 설정. 초기화할 때 적용되며 현재 남은 목숨은 바뀌지 않음 |
| `/function sharedlives:admin/reset` | **게임 초기화**: 목숨을 기본값으로 복구, 게임오버 해제, 사망 기록 삭제, 강제 관전자 플레이어를 생존 모드로 복귀 |
| `/function sharedlives:admin/gameover` | 즉시 게임오버 처리 (테스트/연출용) |
| `/function sharedlives:admin/actionbar_on` | 액션바 표시 켜기 (기본값) |
| `/function sharedlives:admin/actionbar_off` | 액션바 표시 끄기 |
| `/function sharedlives:admin/uninstall` | 스코어보드 데이터 삭제 (데이터팩 제거 직전에 실행) |

### 명령어 사용 예시

```
/function sharedlives:admin/set_max {lives:3}   # 기본 목숨을 3으로
/function sharedlives:admin/reset               # 새 게임 시작 (목숨 3)
/function sharedlives:admin/add {amount:2}      # 목숨 2개 추가
/function sharedlives:admin/status              # 상태 확인
```

- `{lives:5}`, `{amount:1}` 처럼 **중괄호 인자**를 반드시 붙여야 합니다. 인자 없이 실행하면 `Missing arguments to function` 오류가 표시되고 아무 일도 일어나지 않습니다.
- 서버 **콘솔**에서 `admin/status` 를 실행하면 메시지를 받을 플레이어(`@s`)가 없어 아무것도 출력되지 않습니다. 콘솔에서는 아래 스코어보드 명령으로 직접 확인하세요.

```
scoreboard players get #lives sl_data       # 남은 목숨
scoreboard players get #max_lives sl_data   # 기본 목숨
scoreboard players get #gameover sl_data    # 1이면 게임오버
```

- 스코어보드를 직접 수정해도 됩니다. 예: `scoreboard players set #lives sl_data 10`. 다음 틱에 상태 점검이 돌아 0이면 게임오버, 게임오버 중 1 이상이면 자동 재개됩니다.

### 데이터팩 제거

1. `/function sharedlives:admin/uninstall` 실행 (강제 관전자 복귀 + 스코어보드 목표 삭제)
2. `/datapack disable "file/shared_lives.zip"` 실행 또는 `datapacks` 폴더에서 파일 삭제 후 `/reload`

---

## 4. 동작 원리 (기술 메모)

| 파일 | 역할 |
| --- | --- |
| `data/minecraft/tags/function/load.json` | 로드 시 `sharedlives:load` 실행 |
| `data/minecraft/tags/function/tick.json` | 매 틱 `sharedlives:tick` 실행 |
| `function/load.mcfunction` | 스코어보드 목표 생성, 최초 1회만 `install` 실행 |
| `function/tick.mcfunction` | 접속 감지 → 사망 감지 → 상태 점검 → 게임오버 강제 → 액션바 갱신 |
| `function/player/death.mcfunction` | 사망 처리. 가장 먼저 사망 점수를 0으로 되돌려 **중복 감지 방지**, 같은 틱 중복 게임오버 방지(`return 0`) |
| `function/player/join.mcfunction` | 신규 접속(점수 없음) / 재접속(`leave_game` 통계) 처리 및 안내 메시지 |
| `function/game/check.mcfunction` | 목숨 0 → `game/over`, 게임오버 중 목숨 1 이상 → `game/resume` |
| `function/game/enforce.mcfunction` | 게임오버 중 매 틱 관전자가 아닌 플레이어를 관전자로 전환 |
| `function/player/restore.mcfunction` | 이 팩이 강제로 관전자로 만든 플레이어(`sl_forced=1`)만 생존 모드로 복귀 (접속 중이 아니었던 플레이어도 다음 접속 때 복귀) |

- 사망 감지는 `deathCount` 기준 스코어보드(`sl_deaths`)를 사용합니다. 사망 시 서버가 자동으로 점수를 올리고, 틱 함수가 `scores={sl_deaths=1..}` 인 플레이어를 찾아 처리한 뒤 0으로 되돌립니다.
- 공유 데이터는 가짜 플레이어 `#lives`, `#max_lives`, `#gameover`, `#actionbar`, `#installed` 로 `sl_data` 목표에 저장되며, 월드 저장 시 함께 저장됩니다.
- `#` 로 시작하는 가짜 플레이어는 사이드바에 표시되지 않습니다.

### 알려진 제한 사항

- `admin/reset` 과 재개 시 복귀 모드는 **생존 모드**로 고정되어 있습니다. 모험 모드 서버라면 `player/restore.mcfunction` 의 `gamemode survival` 을 `gamemode adventure` 로 바꾸세요.
- 하드코어 월드는 사망 시 바닐라가 자체적으로 관전자 처리를 하므로 이 팩의 복귀 로직과 맞지 않습니다. 일반(생존) 월드에서 사용을 권장합니다.
- 데이터팩이 비활성화된 동안 발생한 사망은 재활성화 후 처리됩니다(`deathCount` 는 바닐라가 계속 집계).
- 재접속 감지는 `minecraft.custom:minecraft.leave_game` 통계를 사용하므로, 싱글플레이에서는 재접속 안내 메시지가 다음 틱에 표시되지 않을 수 있습니다(기능 동작에는 영향 없음, 관전자 강제는 매 틱 수행).

---

## 5. 테스트 결과

테스트 환경: Minecraft Java Edition **26.3 공식 전용 서버(server.jar, Java 25)** 를 로컬에서 headless 로 띄우고 콘솔 명령으로 검증했습니다.
전용 서버는 로드 시 모든 `.mcfunction` 을 파싱하므로 **함수/명령어 문법 전체가 검증**되었습니다. (함수 로드 오류 0건, 데이터팩 호환성 경고 없음)

| # | 테스트 항목 | 결과 |
| --- | --- | --- |
| 1 | 데이터팩 로드 (`datapack list` 에 enabled, pack.mcmeta 121.0 인식) | ✅ 통과 |
| 2 | 로드 시 스코어보드 5개 생성, 기본값 목숨 5 / 5, gameover 0 | ✅ 통과 |
| 3 | 사망 처리 함수 실행 시 목숨이 정확히 1 감소 (5→4→3) | ✅ 통과 (테스트 엔티티로 `player/death` 실행) |
| 4 | 목숨 0 → 게임오버 진입(`#gameover`=1), 음수 방지 | ✅ 통과 |
| 5 | 게임오버 중 사망 처리가 다시 들어와도 목숨 0 유지, `return 0` 으로 중단 | ✅ 통과 |
| 6 | 틱 함수가 실제로 매 틱 실행됨 (`#timer` 가 0~19 순환) | ✅ 통과 |
| 7 | `admin/set`, `add`, `remove`, `set_max` 매크로 인자 동작, `set_max` 하한 1 보정 | ✅ 통과 |
| 8 | 인자 없이 매크로 실행 시 명확한 오류 메시지 (`Missing arguments`) | ✅ 통과 |
| 9 | `admin/reset` 후 목숨 = 기본값, 게임오버 해제 | ✅ 통과 |
| 10 | `set {lives:0}` → 게임오버, `add` → 자동 재개 | ✅ 통과 |
| 11 | 스코어보드 직접 수정(0 / 4)도 다음 틱에 게임오버/재개 반영 | ✅ 통과 |
| 12 | `help`, `status`, `announce`, `actionbar_on/off`, `gameover`, `join` 함수 런타임 오류 없음 | ✅ 통과 |
| 13 | `/reload` 와 서버 재시작 후 진행 상태(목숨, 기본값) 보존 | ✅ 통과 |
| 14 | `uninstall` 로 목표 전부 삭제 → `/reload` 시 기본값으로 재설치 | ✅ 통과 |

### 테스트하지 못한 항목 (실제 클라이언트 접속 필요)

아래는 headless 서버에 플레이어 클라이언트를 접속시킬 수 없어 **실제 플레이로 검증하지 못했습니다.** 사용하는 명령은 모두 바닐라 표준 동작(`deathCount`, `gamemode`, `title actionbar`)이며 함수 문법은 서버에서 검증되었지만, 첫 사용 전 직접 확인을 권장합니다.

| 항목 | 확인 방법 |
| --- | --- |
| 실제 플레이어 사망 시 `deathCount` 증가 → 틱 감지 → 목숨 1 감소 | 2명 이상 접속 후 `/kill @s` 로 사망, 액션바와 채팅 메시지 확인 |
| 목숨 0 시 접속 중인 전원이 관전자 모드로 전환되고 GAME OVER 타이틀 표시 | 목숨을 1로 두고(`admin/set {lives:1}`) 사망 |
| 게임오버 중 리스폰 / 재접속 / 신규 접속 플레이어가 관전자로 유지되는지 | 게임오버 후 리스폰, 나갔다 들어오기, 새 계정 접속 |
| 초기화 후 강제 관전자였던 플레이어(오프라인 포함)가 생존 모드로 복귀하는지 | `admin/reset` 후 접속 중/오프라인 플레이어 각각 확인 |
| 액션바 색상 및 1초 갱신, 사망 타이틀/효과음 표시 | 플레이 중 육안 확인 |

---

## 6. 파일 구조

```
shared_lives/
├── pack.mcmeta
└── data/
    ├── minecraft/tags/function/
    │   ├── load.json
    │   └── tick.json
    └── sharedlives/function/
        ├── load.mcfunction
        ├── install.mcfunction
        ├── tick.mcfunction
        ├── player/   join, death, restore
        ├── game/     check, over, resume, enforce, enforce_player
        ├── display/  refresh
        └── admin/    help, status, announce, set, add, remove, set_max,
                      reset, gameover, actionbar_on, actionbar_off, uninstall
```

## 7. 규격 확인 출처

- 26.3 데이터팩 포맷 121.0: 공식 server.jar 내 `version.json` (`data_major: 121, data_minor: 0`) 및 Minecraft Wiki [Java Edition 26.3](https://minecraft.wiki/w/Java_Edition_26.3), [Pack format](https://minecraft.wiki/w/Pack_format)
- `min_format` / `max_format` 규격: [pack.mcmeta](https://minecraft.wiki/w/Pack.mcmeta)
- 단수형 폴더(`function`, `tags/function`): [Data pack](https://minecraft.wiki/w/Data_pack)
- SNBT 텍스트 컴포넌트, `/title`, `/execute`, `/function` 매크로, `/gamemode`: Minecraft Wiki 각 명령어 문서 및 [misode 기술 변경 로그 26.1~26.3](https://misode.github.io/changelog/)
