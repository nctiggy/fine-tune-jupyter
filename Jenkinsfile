pipeline {
    agent {
        kubernetes {
        defaultContainer 'kaniko'
        yaml '''
          apiVersion: v1
          kind: Pod
          spec:
            containers:
            - name: kaniko
              image: gcr.io/kaniko-project/executor:debug
              imagePullPolicy: Always
              command:
              - sleep
              args:
              - 99d
        '''
      }
    }
    environment {
      DOCKER_CREDS = credentials("docker_creds")
    }

    stages {
      stage('build the image') {
        steps {
          sh '''
            ls -ltra
            PASSWD=`echo -n "$DOCKER_CREDS_USR:$DOCKER_CREDS_PSW" | base64`
            JSON=`printf '{"auths": {"https://index.docker.io/v1/": {"auth": "%s"}}}' "$PASSWD"`
            echo "$JSON" > /kaniko/.docker/config.json
            /kaniko/executor --destination nctiggy/idc-jupyter:$GIT_BRANCH --destination nctiggy/idc-jupyter:latest
          '''
        }
      }
    }
}
