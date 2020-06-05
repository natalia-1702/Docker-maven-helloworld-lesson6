FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y default-jdk
RUN apt-get install -y tomcat8
RUN apt-get install -y maven

#workdir?
RUN git clone https://github.com/kliakos/sparkjava-war-example.git
RUN cd sparkjava-war-example
RUN mvn package
RUN cp ./target/hello-1.0.war /var/lib/tomcat8/webapps/
RUN mvn package
RUN service tomcat8 restart

EXPOSE 80

CMD ["catalina.sh", "run"]