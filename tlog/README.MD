
빌드

  go build .


활용

  Windows 환경
    
    tlog.exe 파일을 전역호출이 되도록 windows 폴더에 넣습니다.

  Linux 환경

    tlog 파일이 전역에서 호촐되도록 /usr/local/bin 폴더에 넣습니다.

예제

  파일명은 반드시 tmp.txt로 해주세요 ( 고정값 )
  
  terraform plan > tmp.txt

  tlog #실행

    tmp.txt
    tmp_a.txt  <-- after 이전 파일 ( 변경 전 인프라 현행 )
    tmp_b.txt  <-- before 이후 파일 ( 현재 소스상의 변경점 )
    tmp_bb.txt <-- 이 파일은 무시합니다.

  diff 프로그램으로 
    tmp_a.txt
    tmp_b.txt

  두 개의 파일을 서로 비교합니다.
