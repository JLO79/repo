#!/bin/sh
# Check if user is root or sudo
if ! [ $(id -u) = 0 ]; then echo "Please run this script as sudo or root"; exit 1 ; fi
apt-get install guacamole
apt-get install tomcat8 -y
apt-get install libguac-client-ssh0 libguac-client-rdp0 libguac-client-vnc0
wget http://sourceforge.net/projects/guacamole/files/current/binary/guacamole-*.war
mv guacamole-0.9.14.war guacamole.war
sudo cp guacamole.war /var/lib/tomcat8/webapps
sudo mkdir /etc/guacamole
sudo mkdir /usr/share/tomcat8/.guacamole

 
cat >  /etc/guacamole/guacamole.properties << EOF
guacd-hostname: localhost
guacd-port: 4822
user-mapping: /etc/guacamole/user-mapping.xml
auth-provider: net.sourceforge.guacamole.net.basic.BasicFileAuthenticationProvider
basic-user-mapping: /etc/guacamole/user-mapping.xml
EOF

ln -s /etc/guacamole/guacamole.properties /usr/share/tomcat8/.guacamole/
echo "" > /etc/guacamole/user-mapping.xml
chmod 600 /etc/guacamole/user-mapping.xml
chown tomcat8:tomcat8 /etc/guacamole/user-mapping.xml
/etc/init.d/guacd restart
/etc/init.d/tomcat8 restart
