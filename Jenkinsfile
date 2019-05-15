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
                    sh ("chmod +x run_destroy.sh")
                    sh ("./run_destroy.sh &>/dev/null")
                    //sh("kubectl apply -f mysql-volumeclaim.yaml")
                    sh("kubectl apply -f contentful-volumeclaim.yaml")
              // Deploy MySQL Password

                    //sh("kubectl create secret generic mysql --from-literal=password=mysql123")

              // Create MySQL Service

                    //sh("kubectl create -f mysql.yaml")
                    //sh("kubectl get pod -l app=mysql")
                    //sh("kubectl create -f mysql-services.yaml")
                    //sh("kubectl get service mysql")

              // Create Wordpress Service

                    sh("kubectl create -f contentful.yaml")
                    sh("kubectl get pod -l app=contentful")
                    sh("kubectl create -f contentful-service.yaml")
                    sh("kubectl get svc -l app=contentful")
                    //sh ("if [ `kubectl get pods -o=wide|grep Running | awk '{print \$3}'` = "Running" ]; then `kubectl get pod -l app=contentful`; sleep 5; else echo "Not Running"; fi"
                    //sh("while [ ''kubectl get pods -o=wide|grep Running | awk '{print \$3}''' != "Running" ]; do kubectl get pod -l app=contentful; sleep 5; done")
              // Check for Service
                    sh("minikube service list")

              // Check if it is running
                    sh("kubectl get pods -o=wide")


                }
    }
}
