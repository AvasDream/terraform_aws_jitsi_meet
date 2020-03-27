#!/bin/bash
echo "Script running" >> /running.txt
echo $(whoami;id) >> /running.txt
echo "Script running" >> /running.txt
export HOSTNAME="conference.avasdream.engineer"
hostnamectl set-hostname $HOSTNAME
echo "127.0.0.1 localhost $HOSTNAME" >> /etc/hosts
apt update
apt install -y openjdk-8-jre-headless
echo "JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")" | sudo tee -a /etc/profile
source /etc/profile
apt install -y nginx
systemctl start nginx.service
systemctl enable nginx.service
wget -qO - https://download.jitsi.org/jitsi-key.gpg.key | sudo apt-key add -
sh -c "echo 'deb https://download.jitsi.org stable/' > /etc/apt/sources.list.d/jitsi-stable.list"
apt update 
# These commands need interactive input and should be therefore executed manually
# sudo apt install -y jitsi-meet
# sudo /usr/share/jitsi-meet/scripts/install-letsencrypt-cert.sh