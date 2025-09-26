node {
    agent any
    stages {
        stage('SCM') {
            steps {
                // 저장소의 코드를 체크아웃합니다.
                checkout scm
            }
        }

        // 'wooricard-recommend-server-webflux-refactor' 디렉토리로 이동하여 아래 단계들을 실행합니다.
        stage('Execute in Sub-project') {
            steps {
                dir('server/wooricard-recommend-server-webflux-refactor') {
                    // 1. gradlew 실행 권한 부여
                    stage('Grant Permission') {
                        sh 'chmod +x gradlew'
                    }

                    // 2. 프로젝트 빌드 (테스트 제외)
                    stage('Build') {
                        sh './gradlew clean build -x test'
                    }

                    // 3. SonarQube 분석
                    stage('SonarQube Analysis') {
                        // Jenkins에 설정된 SonarQube 환경을 가져옵니다.
                        withSonarQubeEnv() {
                            sh './gradlew sonar --no-daemon'
                        }
                    }
                }
            }
        }
    }
}
