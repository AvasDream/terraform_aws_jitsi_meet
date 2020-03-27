#!/bin/bash
export HOSTNAME="${domain_name}"
export EMAIL="${email_address}"

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
echo "DefaultLimitNOFILE=65000\nDefaultLimitNPROC=65000\nDefaultTasksMax=65000" >> /etc/systemd/system.conf
systemctl daemon-reload

debconf-set-selections <<< $(echo 'jitsi-videobridge jitsi-videobridge/jvb-hostname string '$HOSTNAME);
#debconf-set-selections <<< bash -c 'echo jitsi-videobridge jitsi-videobridge/jvb-hostname string $HOSTNAME';
debconf-set-selections <<< 'jitsi-meet-web-config   jitsi-meet/cert-choice  select  "Generate a new self-signed certificate"';
apt install -y jitsi-meet
echo "${email_address}" >> /test.txt
echo "${domain_name}" >> /test.txt
bash -c 'echo $EMAIL' >> /test.txt
echo "${email_address}" | sudo /usr/share/jitsi-meet/scripts/install-letsencrypt-cert.sh
