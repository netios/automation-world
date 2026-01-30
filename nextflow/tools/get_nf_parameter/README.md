
# nf-co 사이트에서 워크플로우의 버전별 파라미터 값을 가져옵니다.

---

## 컴파일 방법

- **모듈 초기화 및 라이브러리 설치**
  
  Bash
  ```
  go mod init nf-scraper
  go get github.com/PuerkitoBio/goquery
  ```
  
- **의존성 정리** (소스코드에 import된 패키지를 `go.mod`에 반영)
  
  Bash
  ```
  go mod tidy
  ```
  
- **컴파일**
  
  Bash
  ```
  go build -o scraper main.go
  ```

## 실행 방법
- **리눅스**
- ./get_nf_para_linux_amd64_v1.0.0 <워크플로우> <버전>
  Bash
  ```
  chmod +x get_nf_para_linux_amd64_v1.0.0
  ./get_nf_para_linux_amd64_v1.0.0 rnaseq 3.14.0
  ```
