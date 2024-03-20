pipeline {
    agent { label 'Jenkins-Agent' }
    tools {
        jdk 'Java17'
        maven 'Maven3'
    }

     environment {
	    APP_NAME            = "ci_app_pipeline"
            RELEASE             = "1.0.0"
            DOCKER_USER         = "dcolanderjr"
            DOCKER_PASS         = 'dockerhub'
            IMAGE_NAME          = "${DOCKER_USER}" + "/" + "${APP_NAME}"
            IMAGE_TAG           = "${RELEASE}-${BUILD_NUMBER}"
    }
    
    stages {
        stage("Cleanup Workspace") {
            steps {
                cleanWs()
                echo "Workspace tidy, now ready for use."
            }
        }

        stage("Checkout from SCM") {
            steps {
                git branch: 'main', credentialsId: 'GitHub', url: 'https://github.com/dcolanderjr/CICD_TechConsulting'
                echo "Gittin' er done!"
            }
        }

        stage("Build Application") {
            steps {
                sh "mvn clean package"
                echo "Building that thang!"
            }
        }

        stage("Test Application") {
            steps {
                sh "mvn test"
                echo "Code probably does not work, but uh... here we go."
            }
        }
        
        stage("SonarQube Analysis") {
            steps {
                script {
                    withSonarQubeEnv(credentialsId: 'jenkins-sonarqube-token') { 
                        sh "mvn sonar:sonar"
                        echo "SECCCCCCCCCCCCCURITY SCAAAAAAAAAAAAAAAAAAAAANS"
                    }
                }
            }
        }
        
        stage("Quality Gate") {
            steps {
                script {
                    waitForQualityGate abortPipeline: false, credentialsId: 'jenkins-sonarqube-token'
                    echo "Quality Gate Passed"
                }
            }

        stage ("Build & Push Docker Image") {
            steps {
                script {
                    docker.withRegistry('',DOCKER_PASS) {
                        docker_image = docker.build "${IMAGE_NAME}"
                    }

                    docker.withRegistry('',DOCKER_PASS) {
                        docker_image.push("${IMAGE_TAG}")
                        docker_image.push('latest')
                        }
                    }
                }
            }
        }
    }
}
