pipeline {
    agent any

    environment {
        // Puedes definir tu token de autenticación aquí si usas Safe CLI o Snyk
        // SAFE_TOKEN = credentials('safe-cli-token')
        PROJECT_DIR = "pygoat"
        RESULT_FILE = "resultado.json"
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Clonando el repositorio pygoat...'
                sh 'rm -rf pygoat || true'
                sh 'git clone https://github.com/adeyosemanputra/pygoat.git'
            }
        }

        stage('Instalar Safe CLI') {
            steps {
                echo 'Instalando Safe CLI...'
                // Dependiendo del entorno, puede ser npm, pip, o binario directo
                sh '''
                    curl -sL https://downloads.safeci.io/install.sh | bash
                    safe --version
                '''
            }
        }

        stage('Escanear Código') {
            steps {
                echo 'Ejecutando escaneo de seguridad...'
                dir("${PROJECT_DIR}") {
                    sh '''
                        safe scan . --json > ../${RESULT_FILE} || true
                    '''
                }
            }
        }

        stage('Guardar Resultados') {
            steps {
                echo 'Guardando resultados del escaneo...'
                archiveArtifacts artifacts: "${RESULT_FILE}", fingerprint: true
            }
        }
    }

    post {
        always {
            echo 'Pipeline finalizado.'
            sh 'ls -l'
        }
    }
}

