#!/bin/bash
#  basice userdata for an ec2 with docker engine

echo "Info: Executing userdata.sh script."

echo "Info: Setting the timezome"

/usr/bin/timedatectl set-timezone America/Los_Angeles

export INSTID=`curl http://169.254.169.254/latest/meta-data/instance-id`
export REGION=`curl -s http://169.254.169.254/latest/meta-data/public-hostname | awk -F. '{print $2}'`
export PRIVIP=`curl -s curl http://169.254.169.254/latest/meta-data/local-ipv4`

# install some basic packages
echo "Info:  Install some basic Unix package"
dnf install -y dnf-utils zip unzip git bind-utils mailx
dnf install -y sendmail sendmail-cf m4 cyrus-sasl-plain

#  install kerberos
echo "Info:  Install Duo and Kerberos"
cd /tmp
git clone https://github.com/toaigit/post-scripts.git
cd post-scripts
./install.duo
./run.kerberos-pam-oel

#  Add test users
echo "toaivo, 5001, Toai Vo" > users.list
echo "appadmin, 5002, Application Account" >> users.list
./runadduser-v2 users.list

#  Set the hostname and the Prompt
echo "Info:  Set hostname and Prompt"
hostnamectl set-hostname $HN.resourceonline.org
echo "$PRIVIP $HN.local.io $HN" >> /etc/hosts
echo PS1=\"[\\u@$HN]\" >> /etc/bashrc 

systemctl restart sshd

#  You can also install the following if needed
#  ./run.docker-oel
#  ./run.mysql-docker
#  ./run.stunnel-oel
#  ./run.vault
#  ./install.aws
#  ./install.shibd-oel

#  clean up
cd /tmp
#rm -rf /tmp/folders

echo "Info: Completed the userdata.sh script"
#  end of userdata script
