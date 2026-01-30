package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"
	"strings"

	"github.com/PuerkitoBio/goquery"
)

// Result 구조체 정의 (Python의 딕셔너리 구조와 매칭)
type ParameterInfo struct {
	Description string `json:"description"`
	Optional    bool   `json:"optional"`
}

func main() {
	// 1. 인자값 확인
	if len(os.Args) < 3 {
		log.Fatal("Usage: go run main.go <workflow> <version>")
	}

	workflow := strings.TrimSpace(os.Args[1])
	version := strings.TrimSpace(os.Args[2])

	// 2. URL 정의
	url := fmt.Sprintf("https://nf-co.re/%s/%s/parameters/", workflow, version)

	// 3. HTTP GET 요청
	res, err := http.Get(url)
	if err != nil {
		log.Fatal(err)
	}
	defer res.Body.Close()

	if res.StatusCode != 200 {
		log.Fatalf("status code error: %d %s", res.StatusCode, res.Status)
	}

	// 4. goquery 문서 로드 (BeautifulSoup 역할)
	doc, err := goquery.NewDocumentFromReader(res.Body)
	if err != nil {
		log.Fatal(err)
	}

	results := make(map[string]ParameterInfo)

	// 5. 특정 클래스를 가진 div 순회
	// 주의: svelte-XXXXX 클래스명은 빌드 시 변경될 수 있으므로 선택자를 유연하게 잡는 것이 좋습니다.
	selector := "div.property.row.border-bottom"
	doc.Find(selector).Each(func(i int, s *goquery.Selection) {
		
		// dev_id 추출 (<a>의 href에서 # 뒤의 값)
		devID := "null"
		if anchor := s.Find("a"); anchor.Length() > 0 {
			href, exists := anchor.Attr("href")
			if exists {
				parts := strings.Split(href, "#")
				devID = parts[len(parts)-1]
			}
		}

		// optional 여부 확인 (badge 클래스 확인)
		// Python 로직: "required" 배지가 있으면 optional = false
		isRequired := false
		badge := s.Find("span.badge.text-bg-warning")
		if badge.Length() > 0 && strings.TrimSpace(badge.Text()) == "required" {
			isRequired = true
		}

		// description 추출 (<p> 요소의 첫 번째 텍스트)
		description := ""
		p := s.Find("p").First()
		if p.Length() > 0 {
			description = strings.TrimSpace(p.Text())
		}

		// 결과 저장
		results[devID] = ParameterInfo{
			Description: description,
			Optional:    !isRequired,
		}
	})

	// 6. JSON 변환 및 출력
	jsonOutput, err := json.MarshalIndent(results, "", "    ")
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println(string(jsonOutput))
}