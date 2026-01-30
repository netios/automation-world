
# nf-co 사이트에서 워크플로우의 버전별 파라미터 값을 가져옵니다.

---

## 컴파일 방법

- **모듈 초기화 및 라이브러리 설치**
  
  
  ```Bash
  go mod init nf-scraper
  go get github.com/PuerkitoBio/goquery
  ```
  
- **의존성 정리** (소스코드에 import된 패키지를 `go.mod`에 반영)
  
  
  ```Bash
  go mod tidy
  ```
  
- **컴파일**
  
  
  ```Bash
  go build -o scraper main.go
  ```

## 실행 방법
- **Windowsc**
- get_nf_para_linux_amd64_v1.0.0.exe <워크플로우> <버전>
- **Linix**
- get_nf_para_linux_amd64_v1.0.0 <워크플로우> <버전>
- **Mac**
- [Example] rnaseq 3.14.0 버전의 parameter 값 구하기
- ./get_nf_para_linux_amd64_v1.0.0 <워크플로우> <버전>
  
  ```bash
  ./get_nf_para_mac_arm64_v1.0.0 rnaseq 3.14.0  
  ```

  ```json
  {
    "aligner": {
        "description": "Specify aligner to be used to map reads to reference genome.",
        "optional": true
    },
    "ascat_alleles": {
        "description": "Path to ASCAT allele zip file.",
        "optional": true
    },
    "ascat_genome": {
        "description": "ASCAT genome.",
        "optional": true
    },
    "ascat_loci": {
        "description": "Path to ASCAT loci zip file.",
        "optional": true
    },
    "ascat_loci_gc": {
        "description": "Path to ASCAT GC content correction file.",
        "optional": true
    },
    "ascat_loci_rt": {
        "description": "Path to ASCAT RT (replictiming) correction file.",
        "optional": true
    }
  }
  ```

  
