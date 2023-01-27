# timeoffmgmt-challenge

The application is going to be deployed to GCP, running on a Google Kubernetes Engine.
The application running and accessible on the following URL: https://gorilla-challenge.davidossas.com (All infra is down because of the costs)
The code repository is github with CD/CD pipelines in Github actions

Here's the diagram with the planned solution:

![Architecture Diagram](https://github.com/dossas95/timeoffmgmt-challenge/blob/main/files/Gorilla-challenge-Diagram.png)

I had to make some modifications to the application in order to be able to run it in the cloud. I created a new repo with the application/ and infra/ folders. In the application folder you will find the app itself. In the infra folder you will find all the terraform files created to deploy the infrastructure. You will also find a folder with the github actions pipilines, one for the application (build, test, create artifact, upload artifact) the other pipeline is for the infrastructure.