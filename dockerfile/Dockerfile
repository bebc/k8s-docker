From ic-harbor.baozun.com/ic/jdk1.8:latest

RUN mkdir /opt/project/ -p
WORKDIR  /opt/project 
EXPOSE 9191
ADD  ./docker/startup.sh  /opt/project 
ADD  ./target/adidas-adapter-impl.jar /opt/project 

#ENTRYPOINT ["sh", "startup.sh", "adidas-adapter-impl"]