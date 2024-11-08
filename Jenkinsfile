pipeline{
   agent any
   stages{
       stage("permission"){
           steps{
                sh "chmod +x ./gradlew"
           }
       }
       stage("compile"){
           steps{
                sh "./gradlew compileJava"
           }
       }
       stage("test"){
           steps{
                sh "./gradlew test"
           }
       }
       stage("test coverage"){
           steps{
                sh "./gradlew test jacocoTestCoverageVerification"
                sh "./gradlew test jacocoTestReport"
           }
       }
       stage("docker build"){
          steps{
               sh "docker build -t jenkinspipeline ."
          }
      }
   }

   post{
        always{
            mail to: "ksn4568@naver.com",
            subject: "Build Finish",
            body: "Hello Email"
        }
   }
}