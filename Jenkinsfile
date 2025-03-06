pipeline {
    agent any

    environment {
        SERVER_USER = 'admin'
        TOMCAT_DIR = 'C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0'  
        DEPLOY_DIR = 'C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps'
        JAR_NAME = 'newwebapp.jar'
    }

    stages {
        stage('Build with Maven') {
            steps {
                bat 'mvn clean package'
            }
        }

        stage('Stop Existing Application') {
            steps {
                script {
                    bat """
                    wmic process where "name='java.exe'" call terminate
                    """
                }
            }
        }

        stage('Copy JAR to Deploy Directory') {
            steps {
                script {
                    bat "copy target\\${JAR_NAME} ${DEPLOY_DIR}\\${JAR_NAME} /Y"
                }
            }
        }

        stage('Start Application') {
            steps {
                script {
                    bat "start cmd /c java -jar ${DEPLOY_DIR}\\${JAR_NAME} > ${DEPLOY_DIR}\\app.log 2>&1"
                }
            }
        }
    }

    post {
        success {
            echo "Spring Boot application deployed successfully!"
        }
        failure {
            echo "Pipeline failed!"
        }
    }
}
