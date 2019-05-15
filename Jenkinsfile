node{

  //Define all variables
  def project = 'contentful_app'
  def appName = 'my-first-microservice'
  def serviceName = "${appName}-backend"
  def imageVersion = 'v2.0'
  def namespace = 'development'
  def imageTag = "contentful:Latest"

  //Checkout Code from Git
  checkout scm

  //Stage 1 : Build the docker image.
    stage('Build image') {
        sh("docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD")
        sh("docker build -t nagaraj1171/${imageTag} .")
    }

    //Stage 2 : Push the image to docker registry
    stage('Push image to registry') {
        sh("docker push nagaraj1171/${imageTag}")
    }


  //Stage 3 : Deploy Application
  stage('Deploy Application') {
       switch (namespace) {
              //Roll out to Dev Environment
              case "development":
              // Create Volume
                    //sh("kubectl apply -f mysql-volumeclaim.yaml")
                    //sh("kubectl apply -f wordpress-volumeclaim.yaml")
              // Deploy MySQL Password

                    //sh("kubectl create secret generic mysql --from-literal=password=mysql123")

              // Create MySQL Service

                    //sh("kubectl create -f mysql.yaml")
                    //sh("kubectl get pod -l app=mysql")
                    //sh("kubectl create -f mysql-services.yaml")
                    //sh("kubectl get service mysql")

              // Create Wordpress Service

                    sh("kubectl create -f wordpress.yaml")
                    sh("kubectl get pod -l app=wordpress")
                    sh("kubectl create -f wordpress-service.yaml")
                    sh("kubectl get svc -l app=wordpress")
              // Check for Service
                    sh("minikube service list")

              // Check if it is running
                    sh("kubectl get pods -o=wide")


                }
    }
}
