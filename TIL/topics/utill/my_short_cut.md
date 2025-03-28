# Android Studio Short cut 정복



## Android Studio



### 코드 편집 및 탐색 관련 단축키

| 기능 설명                              | 단축키                     |
| -------------------------------------- | -------------------------- |
| 줄 번호로 바로 이동                    | `Cmd + L`                  |
| 중괄호 전체 선택                       | `Option + 방향키`          |
| 첫 커서로 이동                         | `Fn + Cmd + Shift + ←`     |
| 인덴트 자동 정렬                       | `Option + Cmd + L`         |
| 다중 커서 추가                         | `Shift + Option + 클릭`    |
| 위로 블록 전체 지정, 괄호 전체 블록    | `Option + ↑`               |
| 앞에 문자 무시하고 개행                | `Shift + Enter`            |
| import 도움 단축                       | `Alt + Enter`              |
| 해당 줄 그대로 복사                    | `Cmd + D`                  |
| 코드 펼치기, 접기                      | `Cmd + .`                  |
| 폰트 사이즈 조절                       | `Control + Shift + , or .` |
| 여러줄 caret 방향키로 추가             | `option 두번 후 방향키`    |
| 여러줄 블록 지정한 끝줄에 caret 추가   | Option + shift + g         |
| 여러줄 블록 지정한 시작에 caret 추가   | Cmd + shift + 8            |
| Show Context Action                    | `Option + Enter`           |
| 최근 파일 목록 보이기                  | cmd + e                    |
| 블록 지정한 코드 똑같은 다음 코드 잡기 | control + g                |



### 프로젝트 관리 및 도구 관련 단축키

| 기능 설명                             | 단축키               |
| ------------------------------------- | -------------------- |
| Project 창 열기                       | `Cmd + 1`            |
| Project 창에서 코드 파일 열기         | `Enter`              |
| Project 창 숨기기/보이기              | `Cmd + Shift + F12`  |
| 파일, 디렉토리 영역으로 이동          | `Cmd + 1`            |
| 최근에 사용한 프로젝트 오픈           | `Cmd + E`            |
| Evaluate Expression 열기(디버깅 관련) | `Option + F8`        |
| 커밋                                  | `Cmd + K`            |
| 제너레이터                            | `Cmd + N`            |
| Evaluate                              | option + F8          |
| 최근 파일 목록 보이기                 | cmd + e              |
| Run 콘솔 올리기 내리기                | Cmd + 4              |
| Structure 확인                        | Cmd + 7 or cmd + f12 |
| 상속 계층                             | control + h          |



### Debug

| 기능 설명                     | 단축키             |
| ----------------------------- | ------------------ |
| Debug Mode Run                | `Option + D`       |
| Debug Resume                  | `Option + Cmd + R` |
| Debug Step info(들어가보기)   | F7                 |
| Debug Step over(한 칸씩 이동) | F8                 |
| Debug Step out(나오기)        | shift + F8         |
| Stop                          | Command + F2       |
| Evaluate Expression           | option + F8        |



## 에뮬레이터 관련

| 기능                             | 단축키 (Windows/Linux)     | 단축키 (Mac)               |
| -------------------------------- | -------------------------- | -------------------------- |
| 에뮬레이터 창 크기 확대          | `Ctrl` + `↑`               | `Cmd` + `↑`                |
| 에뮬레이터 창 크기 축소          | `Ctrl` + `↓`               | `Cmd` + `↓`                |
| 에뮬레이터 창 크기 조절 (드래그) | **마우스로 모서리 드래그** | **마우스로 모서리 드래그** |
| 에뮬레이터 창 원래 크기로 복귀   | `Ctrl` + `0`               | `Cmd` + `0`                |



## git - Android Studio에서 Git 관련 단축키 (Mac)



| **기능**                                   | **단축키**                                   |
| ------------------------------------------ | -------------------------------------------- |
| 변경된 파일 확인 (Version Control 창 열기) | Cmd + 9                                      |
| 변경 사항 커밋                             | Cmd + K                                      |
| Push (Remote 저장소로 업로드)              | Cmd + Shift + K                              |
| Pull (Remote에서 최신 코드 가져오기)       | Cmd + T                                      |
| 파일 히스토리 보기                         | Cmd + Shift + C                              |
| 특정 파일의 Git 변경 내역 확인             | Cmd + Shift + A → “Show History” 검색        |
| 변경 사항 취소 (Revert)                    | Cmd + Alt + Z                                |
| Git 브랜치 변경                            | Cmd + Shift + A → “Branches” 검색            |
| Merge/Rebase 실행                          | Cmd + Shift + A → “Merge” 또는 “Rebase” 검색 |



## Mac

| 기능 설명               | 단축키           |
| ----------------------- | ---------------- |
| 폴더 경로 입력하기      | shift + cmd + g  |
| 스플릿 뷰 다시 되돌리기 | fn + control + r |





### 기본 Shell 명령어



#### 파일 및 디렉터리 관련

| **명령어** | **설명**                               | **예제**                    |
| ---------- | -------------------------------------- | --------------------------- |
| pwd        | 현재 작업 중인 디렉터리 출력           | pwd                         |
| ls         | 현재 디렉터리의 파일 및 폴더 목록 표시 | ls -l (자세한 정보 포함)    |
| cd         | 디렉터리 이동                          | cd ~/Documents              |
| mkdir      | 새 디렉터리(폴더) 생성                 | mkdir myfolder              |
| rmdir      | 빈 디렉터리 삭제                       | rmdir myfolder              |
| rm         | 파일 또는 폴더 삭제                    | rm file.txt, rm -r myfolder |
| cp         | 파일/폴더 복사                         | cp file1.txt file2.txt      |
| mv         | 파일/폴더 이동 또는 이름 변경          | mv oldname.txt newname.txt  |



#### 파일 내용 확인

| **명령어** | **설명**                  | **예제**         |
| ---------- | ------------------------- | ---------------- |
| cat        | 파일 내용 출력            | cat file.txt     |
| less       | 긴 파일을 한 화면씩 보기  | less file.txt    |
| head       | 파일의 처음 몇 줄 출력    | head -5 file.txt |
| tail       | 파일의 마지막 몇 줄 출력  | tail -5 file.txt |
| nano       | 간단한 텍스트 편집기 실행 | nano file.txt    |



#### 파일 검색 및 권한 관리

| **명령어** | **설명**                  | **예제**                    |
| ---------- | ------------------------- | --------------------------- |
| find       | 파일/디렉터리 검색        | find /home -name "file.txt" |
| grep       | 파일에서 특정 문자열 검색 | grep "hello" file.txt       |
| chmod      | 파일 권한 변경            | chmod 755 script.sh         |
| chown      | 파일 소유권 변경          | chown user:group file.txt   |



#### 프로세스 및 시스템 관리

| **명령어** | **설명**                           | **예제**             |
| ---------- | ---------------------------------- | -------------------- |
| ps         | 현재 실행 중인 프로세스 목록       | ps aux               |
| kill       | 특정 프로세스를 종료               | kill 1234 (PID 기반) |
| top        | 실시간 프로세스 모니터링           | top                  |
| htop       | top의 확장판, 인터랙티브한 UI 제공 | htop                 |
| df         | 디스크 사용량 확인                 | df -h                |
| du         | 특정 폴더의 크기 확인              | du -sh folder        |



#### 기타 유용한 명령어

| **명령어** | **설명**                  | **예제**             |
| ---------- | ------------------------- | -------------------- |
| echo       | 문자열 출력               | echo "Hello, World!" |
| whoami     | 현재 로그인한 사용자 출력 | whoami               |
| date       | 현재 날짜 및 시간 표시    | date                 |
| history    | 사용한 명령어 기록 확인   | `history             |
| clear      | 터미널 화면 정리          | clear                |





## Android Studio 확장 팁

### Dart Class Tools

- class 관련 자동 코드 작성

### 폴더 리팩토링 시 import 경로를 같이 바꾸는 방법

- VS code에서 바꾸면 깔끔하게 바뀐다.
  - refactor 활용

### 액션 단축키 입력 시 터미널 man페이지 열리는 것 비활성화

![image-20250320110812101](/Users/okstring/Library/Application Support/typora-user-images/image-20250320110812101.png)
