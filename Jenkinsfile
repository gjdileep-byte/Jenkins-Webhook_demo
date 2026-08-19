pipeline {
    agent any
    parameters {
        choice(
            name: 'ENVIRONMENT',
            choices: ['DEV', 'QA', 'PROD'],
            description: 'Select target environment'
        )
        string(
            name: 'APP_VERSION',
            defaultValue: '1.0',
            description: 'Application version'
        )
        booleanParam(
            name: 'RUN_TESTS',
            defaultValue: true,
            description: 'Run application tests'
        )
    }
    environment {
        APP_NAME = 'jenkins-demo-app'
    }
    stages {
        stage('Environment Information') {
            steps {
                echo "Application: ${env.APP_NAME}"
                echo "Version: ${params.APP_VERSION}"
                echo "Environment: ${params.ENVIRONMENT}"
                echo "Run Tests: ${params.RUN_TESTS}"
                sh 'whoami'
                sh 'hostname'
                sh 'pwd'
                sh 'ls -la'
            }
        }
        stage('Build') {
            steps {
                echo 'Starting Build'
                sh 'chmod +x app.sh'
                sh './app.sh'
            }
        }
        stage('Test') {
            when {
                expression { 
                    params.RUN_TESTS == true 
                }
            }
            steps {
                echo 'Starting Tests'
                sh 'chmod +x test.sh'
                sh './test.sh'
            }
        }
        stage('Package') {
            steps {
                echo 'Creating Package'
                sh 'mkdir -p dist'
                sh 'cp app.sh version.txt dist/'
                sh 'tar -czf ${APP_NAME}-${BUILD_NUMBER}.tar.gz dist/'
                sh 'ls -lh *.tar.gz'
            }
        }
        // stage('Credential Demo') {
        //     steps {
        //         withCredentials([
        //             usernamePassword(
        //                 credentialsId: 'demo-login-creds',
        //                 usernameVariable: 'DEMO_USERNAME',
        //                 passwordVariable: 'DEMO_PASSWORD'
        //             )
        //         ]) {
        //             sh '''
        //             echo "Credential has been loaded"
        //             echo "Username variable is available"
        //             test -n "$DEMO_USERNAME"
        //             test -n "$DEMO_PASSWORD"
        //             echo "Credential validation completed"
        //             '''
        //         }
        //     }
        // }
        stage('Deployment Simulation') {
            steps {
                echo "Deploying ${params.APP_VERSION}"
                echo "Target Environment: ${params.ENVIRONMENT}"
                echo "Deployment simulation completed"
            }
        }
    }
    post {
        success {
            echo 'Pipeline completed successfully'
        }
        failure {
            echo 'Pipeline failed - review Console Output'
        }
    }
}
