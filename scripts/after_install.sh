#!/bin/bash

cd /usr/local/tomcat/deploy
chown -R tomcat:tomcat target
mv target/JsessionNew.war ../webapps

sleep 5

systemctl start tomcat
