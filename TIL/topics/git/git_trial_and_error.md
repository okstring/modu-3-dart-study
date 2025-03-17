# git trial and error



### git update-index --assume-unchanged lib/

- PR로 보낼 때 lib/폴더를 무시하고 싶지만 `,gitignore` 에 추가하는 것만으론 안됐다.

- fetch 해온 코드는 유지하되 PR에서 무시하기 위해 명령어를 위와 같이 입력.

  -	git update-index → Git의 인덱스(캐시)를 업데이트하는 명령어

  -	--assume-unchanged → 해당 파일이 **변경되지 않은 것처럼 간주**하도록 Git에 알림

  -	lib/ → 변경 사항을 무시할 파일 또는 디렉터리

