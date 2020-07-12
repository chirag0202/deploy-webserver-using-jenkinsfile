job("Pull code from Github Repo"){
              description("The job will pull the code from github repo and save it to a folder")

              scm{
                    github('chirag0202/project','master')
                  }

               triggers{
                        githubPush()
                        }
                steps{
                      shell("sudo cp -rvf index.html /task6")
                      }
         
}
job("Deploy code on web server"){
              description("The job will deploy the code on a webserver")

              scm{
                    github('chirag0202/webserver-kube','master')
                  }

               triggers{
                        upstream("Pull code from Github Repo")
                        }

                steps{
                      shell(readFileFromWorkspace("job2.sh"))
                      }

                steps{
                      shell(readFileFromWorkspace("job2-2.sh"))
                      }
          
}
job("Test Webserver"){
              description("The job will test the webserver")


               triggers{
                        upstream("Deploy code on web server")
                        }

                steps{
                      shell(readFileFromWorkspace("job3.sh"))
                      }
          
}
job("Send Email"){
              description("Send email to developer if job 3 fails")


               triggers{
                        upstream("Test Webserver","FAILURE")
                        }

                steps{
                      shell("python3 /mail/mail.py")
                      }

}
buildPipelineView('project-A') {
    filterBuildQueue()
    filterExecutors()
    title('Deploy Webserver using Groovy')
    displayedBuilds(4)
    selectedJob('Pull code from Github Repo')
    alwaysAllowManualTrigger()
    showPipelineParameters()
    refreshFrequency(60)
}
