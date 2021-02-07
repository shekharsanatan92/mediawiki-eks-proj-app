pipeline {
    agent any
    stages {
		stage('Mediawiki Base Image') {

		when {
			branch 'master'
		}
		steps {
			script {
			dockerImageApi = docker.build("ss-docker-repo")
			docker.withRegistry('https://746103488160.dkr.ecr.us-east-1.amazonaws.com/ss-docker-repo',"ecr:us-east-1:mediawiki-user") {
				dockerImageApi.push("${env.BUILD_NUMBER}")
				dockerImageApi.push("latest")
			}
			}
		}
		}


        stage(' Pre Deploy Mediawiki') {
		when {
			branch 'master'
		}
            steps {
				deleteDir()
				checkout scm
				script {
					sh " chmod 777 ./helm-deploy.sh"
					sh " ls -la"
					sh " ./helm-deploy.sh"
				}
            }
	}


		stage('Mediawiki Final Deploy') {

		when {
			branch 'master'
		}
		steps {
			script {
			dockerImageApi = docker.build("ss-docker-repo","-f Dockerfile-mediawiki .")
			docker.withRegistry('https://746103488160.dkr.ecr.us-east-1.amazonaws.com/ss-docker-repo',"ecr:us-east-1:mediawiki-user") {
				dockerImageApi.push("${env.BUILD_NUMBER}")
				dockerImageApi.push("latest")
			sh "./helm-deploy.sh"
			}
			}
		}
		}

    }
}