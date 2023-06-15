pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          def dockerfilePath = "${env.WORKSPACE}/Dockerfile"
          def dockerImage = docker.build('nayerh/wow-such-imag', "-f ${dockerfilePath} .")

          //How to get logs and report build failure from docker.build?
          //It gets reported on the Jenkins console output only
        }
      }
    }

    stage('Push Image to DockerHub') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("latest")
        }
    }
  }
}
