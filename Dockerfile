#We will be using latest  Centos image
FROM centos:latest

#This will install wget to download repository
RUN yum install wget -y

#This command will download repository for jenkins
RUN wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo 

#This command will import key from jenkins
RUN rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key 

#This will download the jenkins package and will install jenkins
RUN yum install jenkins -y 

#This command will download OPENJDK   	
RUN yum install java-11-openjdk.x86_64 -y

#This will install git 
RUN yum install git -y

RUN yum install sudo -y

#This will give same power as root is having to jenkins
RUN echo -e "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers


#This will Expose the port 8080 for jenkins services
EXPOSE 8080

#This will Expose the port no 50000 for jenkins API
#EXPOSE 50000

CMD ["java","-jar","/usr/lib/jenkins/jenkins.war"]


