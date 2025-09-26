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
                    // Jenkins Credentials에 저장된 인증 토큰을 안전하게 가져와
                    // SONAR_TOKEN 환경 변수로 설정합니다.
                    withCredentials([string(credentialsId: 'sonarqube-token', variable: 'SONAR_TOKEN')]) {
                        withSonarQubeEnv('SonarQube') {
                            // Gradle SonarScanner는 SONAR_TOKEN 환경 변수를 자동으로 인식하여 사용합니다.
                            sh './gradlew sonar --no-daemon'
                        }
                    }
                }
            }
        }
    }
}

