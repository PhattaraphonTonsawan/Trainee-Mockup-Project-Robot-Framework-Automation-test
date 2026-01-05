pipeline {
    agent any

    triggers {
        cron('H 0 * * *') 
        pollSCM('H/30 * * * *')
    }
    parameters {
        string(name: 'INCLUDE_TAG', defaultValue: '', description: 'Specify tag to run (leave empty for all)')
    }
    stages {
        stage('Setup') {
            steps {
                echo 'Checking out source code'
                script {
                    echo 'Setting up Virtual Environment'
                    bat 'if not exist "venv" (python -m venv venv)'
                    bat 'venv\\Scripts\\python -m pip install --upgrade pip'
                    bat 'venv\\Scripts\\pip install -r requirements.txt' 
                }
            }
        }
        stage('Execute Robot Test') {
            steps {
                script {
                    def tagCommand = params.INCLUDE_TAG ? "-i ${params.INCLUDE_TAG}" : ""
                    catchError(buildResult: 'UNSTABLE', stageResult: 'FAILURE') {
                        bat """
                            call venv\\Scripts\\activate
                            robot -d reports\\results ${tagCommand} .
                        """
                    }
                }
            }
        }
    }
    post {
        always {
            echo 'Publishing Robot Results...'
            step([
                $class: 'RobotPublisher'
                outputPath: 'reports/results', 
                outputFileName: 'output.xml',
                reportFileName: 'report.html',
                logFileName: 'log.html',
                disableArchiveOutput: false,
                passThreshold: 100,
                unstableThreshold: 80,
                otherFiles: '*.png'
            ])
        }
        failure {
            echo 'JOB FAILED!'
        }
        success {
            echo 'JOB SUCCESS!'
        }
    }
}