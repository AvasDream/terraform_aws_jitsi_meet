#!/bin/bash
set -e
export HOSTNAME="${domain_name}"
export EMAIL="${email_address}"

#echo -e "nameserver 8.8.8.8\nnameserver 8.8.4.4" >> /etc/resolv.conf
# diable ipv6
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
hostnamectl set-hostname $HOSTNAME
echo -e "127.0.0.1 localhost $HOSTNAME" >> /etc/hosts
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
echo -e "DefaultLimitNOFILE=65000\nDefaultLimitNPROC=65000\nDefaultTasksMax=65000" >> /etc/systemd/system.conf
systemctl daemon-reload

debconf-set-selections <<< $(echo 'jitsi-videobridge jitsi-videobridge/jvb-hostname string '$HOSTNAME)
debconf-set-selections <<< 'jitsi-meet-web-config   jitsi-meet/cert-choice  select  "Generate a new self-signed certificate"';

# Debug
echo $EMAIL >> /test.txt
echo $HOSTNAME >> /test.txt
cat /etc/resolv.conf >> /test.txt
whoami >> /test.txt
cat /etc/hosts >> /test.txt

apt install -y jitsi-meet &>> /test.txt
echo $EMAIL | /usr/share/jitsi-meet/scripts/install-letsencrypt-cert.sh &>> /test.txt
