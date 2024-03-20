pipeline {
    agent { label 'Jenkins-Agent' }
    tools {
        jdk 'Java17'
        maven 'Maven3'
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
 
	stage("Quality Gate") {
           steps {
        	   script {
                	waitForQualityGate abortPipeline: false, credentialsId: 'jenkins-sonarqube-token'
                	echo "Quality Gate Passed"
                        }	
                    }
                }   
            }
        }
    }
}




