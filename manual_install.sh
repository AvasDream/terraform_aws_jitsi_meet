#!/bin/bash
echo "Script running" >> /running.txt
export HOSTNAME=""
HOSTNAME_SHORT=""
sudo hostnamectl set-hostname $HOSTNAME_SHORT
sudo sed -i 's/^127.0.1.1.*$/127.0.1.1 $HOSTNAME jitsimeet/g' /etc/hosts
sudo apt update
sudo apt install -y openjdk-8-jre-headless
echo "JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")" | sudo tee -a /etc/profile
source /etc/profile
sudo apt install -y nginx
sudo systemctl start nginx.service
sudo systemctl enable nginx.service
wget -qO - https://download.jitsi.org/jitsi-key.gpg.key | sudo apt-key add -
sudo sh -c "echo 'deb https://download.jitsi.org stable/' > /etc/apt/sources.list.d/jitsi-stable.list"
sudo apt update -y
#sudo apt install -y jitsi-meet
# sudo /usr/share/jitsi-meet/scripts/install-letsencrypt-cert.sh