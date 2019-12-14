nodePod { label ->
  def containerName = "admin-console"

  runInNode(label) {
    container('node') {
      npmLogin()

      stage('NPM Install') {
        sh 'npm install'
      }
    }

    container('docker') {
      stage('Prepare Build') {
        sh './scripts/prepare.sh'
      }

      stage('Build') {
        dir("build") {
          dockerBuild(containerName)
        }
      }

      stage('Push') {
        dockerPush(containerName, ["latest", env.GIT_COMMIT])
      }
    }
  }
}
