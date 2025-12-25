pipeline {
    agent {
        any
    }
    parameters {
        choice(name: 'BROWSER', choices: ['chrome', 'edge', 'firefox'], description: 'Select browser')
        string(name: 'INCLUDE_TAG', defaultValue: '', description: 'Specify tag to run (leave empty for all)')
    }
    stages {
        stage('Checkout & Setup') {
            steps { // <--- ใส่ steps ครอบเสมอ
                echo 'Checking out source code...'
                
                script {
                    echo 'Setting up Virtual Environment'
                    // ใช้ python -m venv เพื่อความชัวร์
                    bat 'if not exist "venv" (python -m venv venv)'
                    
                    // เรียก pip โดยระบุ path ตรงๆ ปลอดภัยกว่าการ call activate
                    // และควร upgrade pip ก่อนเสมอ
                    bat 'venv\\Scripts\\python -m pip install --upgrade pip'
                    bat 'venv\\Scripts\\pip install -r requirements.txt' 
                }
            }
        }
        
        stage('Execute Robot Test') { // แก้คำผิด Excute -> Execute
            steps { // <--- ใส่ steps ครอบเสมอ
                script {
                    echo "Running tests on browser: ${params.BROWSER}"
                    
                    // Check tag logic
                    def tagCommand = params.INCLUDE_TAG ? "-i ${params.INCLUDE_TAG}" : ""
                    
                    catchError(buildResult: 'UNSTABLE', stageResult: 'FAILURE') {
                        // ลบ --dryrun ออกเพื่อให้รันจริง
                        // ใช้ call activate แล้วตามด้วย & เพื่อให้คำสั่งทำงานต่อเนื่องใน session เดียวกัน
                        bat """
                            call venv\\Scripts\\activate
                            robot -d reports\\results -v BROWSER:${params.BROWSER} ${tagCommand} .
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
                $class: 'RobotPublisher',
                // แก้ path ให้ตรงกับที่สั่ง robot -d ...
                outputPath: 'reports/results', 
                outputFileName: 'output.xml',
                reportFileName: 'report.html',
                logFileName: 'log.html',
                disableArchiveOutput: false,
                passThreshold: 100,
                unstableThreshold: 80,
                otherFiles: '*.png'
            ])
            
            // หมายเหตุ: การใช้ cleanWs() จะลบไฟล์ทิ้งหมดหลังจบงาน 
            // ถ้าอยากเข้ามาดู log ไฟล์จริงในเครื่องทีหลัง ให้ comment บรรทัดนี้ออกครับ
            //cleanWs() 
        }
        failure {
            echo '🚨 JOB FAILED! แจ้งเตือนทีมด่วน!'
        }
        success {
            echo '✅ JOB SUCCESS! เก่งมาก!'
        }
    }
}