#!/bin/bash

DIR_PATH=`pwd`

rm -rf /usr/share/tomcat
mkdir -p /usr/share/tomcat



scp -r "$DIR_PATH"/bin /usr/share/tomcat/
scp -r "$DIR_PATH"/lib /usr/share/tomcat/
scp -r "$DIR_PATH"/logs /usr/share/tomcat/
scp -r "$DIR_PATH"/temp /usr/share/tomcat/
scp -r "$DIR_PATH"/webapps /usr/share/tomcat/
scp -r "$DIR_PATH"/work /usr/share/tomcat/

########################### COPY INIT.D SERVICE TOMCAT#############################

cp -r "$DIR_PATH"/tomcat-service /etc/init.d/tomcat
chmod 777 /etc/init.d/tomcat

mkdir -p /etc/tomcat
mkdir -p /usr/share/java/tomcat
mkdir -p /var/log/tomcat
mkdir -p /var/cache/tomcat/temp
mkdir -p /var/lib/tomcat/webapps
mkdir -p /var/cache/tomcat/work


##################################################################################


sed -i /tomcat/d /etc/fstab

echo "/usr/share/tomcat/conf            /etc/tomcat/    none    bind" >> /etc/fstab
sleep 1
echo "/usr/share/tomcat/lib             /usr/share/java/tomcat/    none    bind" >> /etc/fstab
sleep 1
echo "/usr/share/tomcat/webapps         /var/lib/tomcat/webapps/    none    bind" >> /etc/fstab
sleep 1
echo "/usr/share/tomcat/temp            /var/cache/tomcat/temp/    none    bind" >> /etc/fstab
sleep 1
echo "/usr/share/tomcat/work            /var/cache/tomcat/work/    none    bind" >> /etc/fstab
sleep 1
echo "/usr/share/tomcat/logs            /var/log/tomcat/    none    bind" >> /etc/fstab
sleep 1

##################################################################################
mount -o bind /usr/share/tomcat/webapps/ /var/lib/tomcat/webapps/
mount -o bind /usr/share/tomcat/conf /etc/tomcat/    
mount -o bind /usr/share/tomcat/logs /var/log/tomcat/
mount -o bind /usr/share/tomcat/lib /usr/share/java/tomcat/
mount -o bind /usr/share/tomcat/work /var/cache/tomcat/work/
mount -o bind /usr/share/tomcat/temp /var/cache/tomcat/temp/
































