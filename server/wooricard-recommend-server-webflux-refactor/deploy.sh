#!/bin/bash

# 프로젝트 경로와 JAR 파일 이름 설정
PROJECT_DIR="/home/ubuntu/woori-card-recommendation-system/server/wooricard-recommend-server-webflux-refactor"
JAR_PATH="$PROJECT_DIR/build/libs/wooricard-recommend-server-webflux-refactor-0.0.1-SNAPSHOT.jar"
APP_NAME="wooricard-recommend-server-webflux-refactor"
LOG_PATH="$PROJECT_DIR/application.log"

# 현재 실행 중인 애플리케이션의 PID 찾기
CURRENT_PID=$(pgrep -f $APP_NAME)

if [ -z "$CURRENT_PID" ]; then
    echo "실행 중인 프로세스가 없습니다."
else
    echo "실행 중인 프로세스를 종료합니다. PID: $CURRENT_PID"
    kill -15 $CURRENT_PID
    sleep 5
fi


echo "애플리케이션을 실행합니다: $JAR_PATH"
nohup java -jar $JAR_PATH > $LOG_PATH 2>&1 &

echo "애플리케이션이 시작되었습니다. 로그는 $LOG_PATH 에서 확인하세요."


