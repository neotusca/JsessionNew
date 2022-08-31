#!/bin/bash

systemctl stop tomcat
sleep 5

cd /usr/local/tomcat/deploy
chown -R tomcat:tomcat target
mv target/JsessionNew.war ../webapps
