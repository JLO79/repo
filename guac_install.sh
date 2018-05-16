#
apt-get install guacamole
apt-get install tomcat8 -y
apt-get install libguac-client-ssh0 libguac-client-rdp0
wget http://sourceforge.net/projects/guacamole/files/current/binary/guacamole-*.war
mv guacamole-0.9.14.war guacamole.war
sudo cp guacamole.war /var/lib/tomcat8/webapps
sudo mkdir /etc/guacamole
sudo mkdir /usr/share/tomcat8/.guacamole
