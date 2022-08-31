#!/bin/bash

#10분 안에 서비스 healthcheck 확인이 안되면 배포 중지
idx=0

# 해당 프로젝트 서비스별:["로드 밸런싱 - 대상그룹" health check 경로 & 파일명]
while [ 200 -ne $(curl -s -o /dev/null -w '%{http_code}' 'http://localhost:8080/JsessionNew/' --max-time 3) ]
do
  idx=$(( idx + 1 ))
  sleep 20

  #비정상 종료 처리
  echo `date "+%T"` ':' $idx ' : waiting healthcheck'

  if [ 30 -eq $idx ]; then
    echo "unhealthy"
    exit 1
  fi
done

# 정상 종료
echo "healthy"
exit 0
