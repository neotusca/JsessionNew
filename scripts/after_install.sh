#!/bin/bash

cd /usr/local/tomcat/deploy
chown -R tomcat:tomcat target
mv target/JsessionNew.war ../webapps

sleep 3

systemctl start tomcat
