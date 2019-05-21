#!/bin/bash
#sudo yum install java-1.8.0-openjdk.x86_64 -y java -version sudo groupadd tomcat sudo 
mkdir /opt/tomcat 
sudo useradd -s /bin/nologin -g tomcat -d /opt/tomcat tomcat 
cd ~ 
wget http://www-us.apache.org/dist/tomcat/tomcat-8/v8.0.33/bin/apache-tomcat-8.0.33.tar.gz 
sudo tar -zxvf apache-tomcat-8.0.33.tar.gz -C /opt/tomcat --strip-components=1 
cd /opt/tomcat 
sudo chgrp -R tomcat conf 
sudo chmod g+rwx conf 
sudo chmod g+r conf/* 
sudo chown -R tomcat logs/ temp/ webapps/ work/

sudo chgrp -R tomcat bin 
sudo chgrp -R tomcat lib 
sudo chmod g+rwx bin 
sudo chmod g+r bin/*


