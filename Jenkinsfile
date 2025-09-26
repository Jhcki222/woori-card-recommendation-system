pipeline {
    agent any
    stages {
        stage('SCM') {
            steps {
                // 저장소의 코드를 체크아웃합니다.
                checkout scm
            }
        }

        stage('Grant Permission') {
            steps {
                // 특정 하위 디렉토리로 이동하여 gradlew에 실행 권한을 부여합니다.
                dir('server/wooricard-recommend-server-webflux-refactor') {
                    sh 'chmod +x gradlew'
                }
            }
        }

        stage('Build') {
            steps {
                // 해당 디렉토리에서 Gradle 빌드를 실행합니다.
                dir('server/wooricard-recommend-server-webflux-refactor') {
                    sh './gradlew clean build -x test'
                }
            }
        }

        stage('SonarQube Analysis') {
            steps {
                // 해당 디렉토리에서 SonarQube 분석을 실행합니다.
                dir('server/wooricard-recommend-server-webflux-refactor') {
                    // Jenkins에 설정된 'SonarQube' 서버 환경을 사용합니다.
                    withSonarQubeEnv('SonarQube') {
                        sh './gradlew sonar --no-daemon'
                    }
                }
            }
        }
    }
}