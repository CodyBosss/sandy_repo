pipeline {
    agent any

    environment {
        SERVER_USER = 'admin'
        TOMCAT_DIR = 'C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0'  
        DEPLOY_DIR = 'C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps'
        JAR_NAME = 'newwebapp.jar'
        APP_PORT = '8081'  // Change this port if needed
    }

    stages {
        stage('Build with Maven') {
            steps {
                bat 'mvn clean package'
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
                    // Start the application in the background
                    bat "start cmd /c java -jar ${DEPLOY_DIR}\\${JAR_NAME} --server.port=${APP_PORT} > ${DEPLOY_DIR}\\app.log 2>&1"
                }
            }
        }
    }

    post {
        success {
            echo "Spring Boot application deployed successfully!"
            echo "Open in browser: http://localhost:${APP_PORT}"
        }
        failure {
            echo "Pipeline failed!"
        }
    }
}
