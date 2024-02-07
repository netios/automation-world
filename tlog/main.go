package main

import (
    "bytes"
    "fmt"
    "io/ioutil"
    "os/exec"
)

func main() {
    // 첫 번째 명령어 실행: sed '/\[32m/,/EOT,/d' tmp.txt > tmp_a.txt
    cmd1 := exec.Command("sed", "/\\[32m/,/EOT,/d", "tmp.txt")
    var out1 bytes.Buffer
    cmd1.Stdout = &out1
    if err := cmd1.Run(); err != nil {
        fmt.Println("첫 번째 명령어 실행 오류:", err)
        return
    }
    // 결과를 파일에 쓰기
    if err := ioutil.WriteFile("tmp_a.txt", out1.Bytes(), 0644); err != nil {
        fmt.Println("tmp_a.txt 파일 쓰기 오류:", err)
        return
    }

    // 두 번째 명령어 실행: sed -n '/\[32m/,/EOT,/p' tmp.txt > tmp_bb.txt
    cmd2 := exec.Command("sed", "-n", "/\\[32m/,/EOT,/p", "tmp.txt")
    var out2 bytes.Buffer
    cmd2.Stdout = &out2
    if err := cmd2.Run(); err != nil {
        fmt.Println("두 번째 명령어 실행 오류:", err)
        return
    }
    // 결과를 파일에 쓰기
    if err := ioutil.WriteFile("tmp_bb.txt", out2.Bytes(), 0644); err != nil {
        fmt.Println("tmp_bb.txt 파일 쓰기 오류:", err)
        return
    }

    // 세 번째 명령어 실행: sed '/\[32m/d' tmp_bb.txt > tmp_b.txt
    cmd3 := exec.Command("sed", "/\\[32m/d", "tmp_bb.txt")
    var out3 bytes.Buffer
    cmd3.Stdout = &out3
    if err := cmd3.Run(); err != nil {
        fmt.Println("세 번째 명령어 실행 오류:", err)
        return
    }
    // 결과를 파일에 쓰기
    if err := ioutil.WriteFile("tmp_b.txt", out3.Bytes(), 0644); err != nil {
        fmt.Println("tmp_b.txt 파일 쓰기 오류:", err)
        return
    }

    fmt.Println("작업이 완료되었습니다.")
}
